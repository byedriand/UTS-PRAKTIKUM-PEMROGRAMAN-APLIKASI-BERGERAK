import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'widget_bertingkat_page.dart';
import 'user_input_page.dart';
import 'dynamic_list_page.dart';
import 'navigasi_sederhana_page.dart';
import 'grid_view_page.dart';
import 'tentang_saya_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Counter',
      'index': 0,
      'icon': Icons.add_circle_outline,
      'color': const Color(0xFF9C27B0),
      'colorDark': const Color(0xCC9C27B0),
      'colorLight': const Color(0x669C27B0),
      'desc': 'Aplikasi counter'
    },
    {
      'title': 'Widget Bertingkat',
      'index': 1,
      'icon': Icons.layers,
      'color': const Color(0xFFFF9800),
      'colorDark': const Color(0xCCFF9800),
      'colorLight': const Color(0x66FF9800),
      'desc': 'Layout bertingkat'
    },
    {
      'title': 'User Input',
      'index': 2,
      'icon': Icons.input,
      'color': const Color(0xFF009688),
      'colorDark': const Color(0xCC009688),
      'colorLight': const Color(0x66009688),
      'desc': 'Form input'
    },
    {
      'title': 'Dynamic List',
      'index': 3,
      'icon': Icons.list,
      'color': const Color(0xFFF44336),
      'colorDark': const Color(0xCCF44336),
      'colorLight': const Color(0x66F44336),
      'desc': 'List dinamis'
    },
    {
      'title': 'Navigasi',
      'index': 4,
      'icon': Icons.navigation,
      'color': const Color(0xFF2196F3),
      'colorDark': const Color(0xCC2196F3),
      'colorLight': const Color(0x662196F3),
      'desc': 'Navigasi'
    },
    {
      'title': 'Grid View',
      'index': 5,
      'icon': Icons.grid_view,
      'color': const Color(0xFF4CAF50),
      'colorDark': const Color(0xCC4CAF50),
      'colorLight': const Color(0x664CAF50),
      'desc': 'Grid layout'
    },
    {
      'title': 'Tentang Saya',
      'index': 6,
      'icon': Icons.person,
      'color': const Color(0xFFE91E63),
      'colorDark': const Color(0xCCE91E63),
      'colorLight': const Color(0x66E91E63),
      'desc': 'Profil'
    },
  ];

  void _navigateTo(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const CounterPage();
        break;
      case 1:
        page = const WidgetBertingkatPage();
        break;
      case 2:
        page = const UserInputPage();
        break;
      case 3:
        page = const DynamicListPage();
        break;
      case 4:
        page = const NavigasiSederhanaPage();
        break;
      case 5:
        page = const GridViewPage();
        break;
      case 6:
        page = const TentangSayaPage();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPorto',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
            fontSize: 24,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1565C0), Color(0xFF0097A7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 8,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5F5F5), Color(0xFFEEEEEE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1A000000),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '👋 Halo!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xDE000000),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Pilih fitur untuk melihat demo',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0x8A000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Fitur Tersedia:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xDE000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = _menuItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: _buildMenuCard(context, item),
                    );
                  },
                  childCount: _menuItems.length,
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.all(8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, Map<String, dynamic> item) {
    return InkWell(
      onTap: () => _navigateTo(context, item['index']),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              item['colorDark'] as Color,
              item['colorLight'] as Color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: item['color'] as Color,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0x33FFFFFF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['title'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item['desc'] as String,
                      style: const TextStyle(
                        color: Color(0xE0FFFFFF),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
