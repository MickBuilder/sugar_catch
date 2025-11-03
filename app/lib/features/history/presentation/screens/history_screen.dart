import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/core/services/history_service.dart';
import 'package:cleanfood/core/services/favorites_service.dart';
import 'package:cleanfood/features/history/presentation/widgets/history_item_widget.dart';

class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = useState<List<HistoryItem>>([]);
    final selectedTab = useState<String>('All');
    final isLoading = useState<bool>(false);
    final hasMore = useState<bool>(true);
    final scrollController = useScrollController();

    // Load initial chunk
    useEffect(() {
      _loadHistoryChunk(history, isLoading, hasMore, 0);
      return null;
    }, []);

    // Listen to scroll for pagination
    useEffect(() {
      void onScroll() {
        if (scrollController.hasClients) {
          final maxScroll = scrollController.position.maxScrollExtent;
          final currentScroll = scrollController.position.pixels;
          final threshold = maxScroll * 0.8; // Load more when 80% scrolled

          if (currentScroll >= threshold && !isLoading.value && hasMore.value) {
            _loadHistoryChunk(history, isLoading, hasMore, history.value.length);
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController, isLoading.value, hasMore.value, history.value.length]);

    // Filter by favorites if needed
    final displayedHistory = selectedTab.value == 'All' 
        ? history.value 
        : history.value.where((item) => FavoritesService.isFavorite(item.product.code)).toList();

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light gray background
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: const Text(
          'Scans',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: CupertinoColors.black,
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // TODO: Implement settings
          },
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedSettings01,
            color: CupertinoColors.black,
            size: 24,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Tabs: All and Favorites
            _buildTabs(selectedTab.value, (tab) {
              selectedTab.value = tab;
            }),
            
            // History list
            Expanded(
              child: _buildHistoryContent(
                displayedHistory,
                isLoading.value,
                hasMore.value,
                scrollController,
                selectedTab.value,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs(String selectedTab, Function(String) onTabSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _buildTab('All', selectedTab == 'All', () => onTabSelected('All')),
          const SizedBox(width: 8),
          _buildTab('Favorites', selectedTab == 'Favorites', () => onTabSelected('Favorites')),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? CupertinoColors.black : CupertinoColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? CupertinoColors.white : CupertinoColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryContent(
    List<HistoryItem> historyList,
    bool isLoading,
    bool hasMore,
    ScrollController scrollController,
    String selectedTab,
  ) {
    if (historyList.isEmpty && !isLoading) {
      return _buildEmptyState(selectedTab);
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: historyList.length + (hasMore || isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        // Show loading indicator at the bottom
        if (index >= historyList.length) {
          return _buildLoadingIndicator(isLoading, hasMore);
        }
        
        return HistoryItemWidget(item: historyList[index]);
      },
    );
  }

  Widget _buildLoadingIndicator(bool isLoading, bool hasMore) {
    if (!hasMore && !isLoading) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: isLoading
          ? const CupertinoActivityIndicator()
          : const SizedBox.shrink(),
    );
  }

  Future<void> _loadHistoryChunk(
    ValueNotifier<List<HistoryItem>> history,
    ValueNotifier<bool> isLoading,
    ValueNotifier<bool> hasMore,
    int offset,
  ) async {
    if (isLoading.value) return; // Prevent concurrent loads

    isLoading.value = true;

    try {
      final result = HistoryService.getHistoryPaginated(
        offset: offset,
        limit: 20, // Load 20 items per chunk
      );

      if (offset == 0) {
        // Initial load - replace all
        history.value = result.items;
      } else {
        // Load more - append to existing
        history.value = [...history.value, ...result.items];
      }

      hasMore.value = result.hasMore;
    } catch (e) {
      // Handle error if needed
    } finally {
      isLoading.value = false;
    }
  }

  Widget _buildEmptyState(String selectedTab) {
    final isEmptyFavorites = selectedTab == 'Favorites';
    
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: CupertinoColors.separator, width: 0.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HugeIcon(
              icon: isEmptyFavorites 
                  ? HugeIcons.strokeRoundedBookmark01
                  : HugeIcons.strokeRoundedQrCode01,
              size: 48,
              color: CupertinoColors.systemGrey,
            ),
            const SizedBox(height: 16),
            Text(
              isEmptyFavorites ? 'No favorites yet' : 'No scans yet',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.systemGrey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isEmptyFavorites
                  ? 'Bookmark products you love to see them here'
                  : 'Start scanning products to see your history here',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: CupertinoColors.systemGrey2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
