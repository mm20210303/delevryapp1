//import 'package:delivery_traning/AccountRequestsPage.dart';
//import 'package:delivery_traning/User%20Accounts%20Page.dart';
//import 'package:delivery_traning/delevery_page.dart';
//import 'package:delivery_traning/notifications_page.dart';
//import 'package:delivery_traning/profile_page.dart';
//import 'package:delivery_traning/shop_page1.dart';
//import 'package:delivery_traning/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  String selectedFilter = 'اليوم';
  DateTime? selectedDate;
  DateTime? selectedMonth;
  String adminName = 'توصيل الطلبات'; // Default title
  bool isLoadingName = true;

  @override
  void initState() {
    super.initState();
    _loadAdminName();
  }

  Future<void> _loadAdminName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final adminName = prefs.getString('admin_name');

      if (!mounted) return;

      if (adminName != null && adminName.isNotEmpty) {
        setState(() {
          this.adminName = adminName;
          isLoadingName = false;
        });
        return;
      }

      // fallback: default name
      if (!mounted) return;
      setState(() {
        isLoadingName = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoadingName = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            isLoadingName ? 'جاري التحميل...' : adminName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white, size: 40),
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ),
                );*/
              },
            ),
          ],
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.count(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.only(bottom: 40),
                        children: [
                          _buildGridCard(context, 'التقارير التفصيلية', Icons.bar_chart, Colors.green.shade600),
                          _buildGridCard(context, 'إدارة المتاجر', Icons.storefront_outlined, Colors.blue.shade600),
                          _buildGridCard(context, 'إدارة السائقين', Icons.delivery_dining_outlined, Colors.orange.shade600),
                          _buildGridCard(context, 'إضافة أدمن جديد', Icons.person_add, Colors.purple.shade600),
                          _buildGridCard(context, 'البروفايل', Icons.person_outline, Colors.red.shade600),
                          _buildGridCard(context, 'طلبات فتح حساب', Icons.pending_actions, Colors.lightBlue.shade600),
                          _buildGridCard(context, 'حسابات المستخدمين', Icons.manage_accounts, Colors.amber.shade600),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGridCard(BuildContext context, String title, IconData icon, Color color) {
    return GestureDetector(
     /* onTap: () async {
        switch (title) {
          case 'إضافة أدمن جديد':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminSignupScreen()));
            break;
          case 'إدارة المتاجر':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopPage1()));
            break;
          case 'إدارة السائقين':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DeleveryPage()));
            break;
          case 'البروفايل':
            final prefs = await SharedPreferences.getInstance();
            final phone = prefs.getString('admin_phone') ?? '';
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(phone: phone)));
            break;
          case 'التقارير التفصيلية':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportsPage()));
            break;
          case 'حسابات المستخدمين':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const UserAccountsScreen()));
            break;
          case 'طلبات فتح حساب':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountRequestsPage()));
            break;
          default:
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(2, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );*/
      onTap: () {
        // Handle card tap if needed
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(2, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
}
}