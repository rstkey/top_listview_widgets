import 'package:top_listview_widgets/src/pages/grouped_listview.dart';
import 'package:top_listview_widgets/src/pages/horizontal_listview.dart';
import 'package:top_listview_widgets/src/pages/infinite_scrolling_listview.dart';
import 'package:top_listview_widgets/src/pages/listview_with_json_data.dart';
import 'package:top_listview_widgets/src/pages/listview_with_navigator.dart';
import 'package:top_listview_widgets/src/pages/nested_columns_and_listviews.dart';
import 'package:top_listview_widgets/src/pages/pull_to_refresh.dart';
import 'package:top_listview_widgets/src/pages/reorderable_listview.dart';
import 'package:top_listview_widgets/src/pages/search_filter_listview.dart';
import 'package:top_listview_widgets/src/pages/single_child_scroll_view.dart';
import 'package:top_listview_widgets/src/pages/spread_operator.dart';
import 'package:top_listview_widgets/src/pages/sticky_header.dart';
import 'package:top_listview_widgets/src/pages/vertical_listview.dart';

List<Map<String, Object>> pageItems = [
  {
    "pageName": "Pull To Refresh",
    "route": const PullToRefreshPage(title: "Pull To Refresh")
  },
  {
    "pageName": "Infinite Scrolling ListView",
    "route": const InfiniteScrollingListViewPage(
        title: "Infinite Scrolling ListView")
  },
  {
    "pageName": "Spread Operator",
    "route": const SpreadOperatorPage(title: "Spread Operator")
  },
  {
    "pageName": "Nested Columns and ListViews",
    "route": const NestedColumnsAndListViewsPage(
        title: "Nested Columns and ListViews")
  },
  {
    "pageName": "SingleChildScrollView",
    "route": const SingleChildScrollViewPage(title: "SingleChildScrollView")
  },
  {
    "pageName": "ListView With JSON Data",
    "route": const ListViewWithJsonDataPage(title: "ListView With JSON Data")
  },
  {
    "pageName": "Sticky Header",
    "route": const StickyHeaderPage(title: "Sticky Header")
  },
  {
    "pageName": "Search & Filter ListView",
    "route": const SearchFilterListViewPage(title: "Search & Filter ListView")
  },
  {
    "pageName": "Reorderable ListView",
    "route": const ReorderableListViewPage(title: "Reorderable ListView")
  },
  {
    "pageName": "ListView With Navigator",
    "route": const ListViewWithNavigatorPage(title: "ListView With Navigator")
  },
  {
    "pageName": "Horizontal ListView",
    "route": const HorizontalListViewPage(title: "Horizontal ListView")
  },
  {
    "pageName": "Vertical ListView",
    "route": const VerticalListViewPage(title: "Vertical ListView")
  },
  {
    "pageName": "Grouped ListView",
    "route": const GroupedListViewPage(title: "Grouped ListView")
  },
];
