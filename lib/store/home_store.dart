import 'package:flutter/material.dart';
//import 'package:delivery_traning/Home_app.dart/completedordersscreen_shope.dart';
/*import 'package:delivery_traning/Home_app.dart/NewOrderScreen.dart';
import 'package:delivery_traning/Home_app.dart/nofication_shope.dart';
import 'package:delivery_traning/Home_app.dart/order_detailes_shope.dart';
import 'package:delivery_traning/Home_app.dart/order_hourse_shope.dart';
import 'package:delivery_traning/Home_app.dart/previousordersscreen_shope.dart';
import 'package:delivery_traning/Home_app.dart/report_shope.dart';
import 'package:delivery_traning/Home_app.dart/shope_profile.dart';
import '../widget/notification_badge.dart';*/

class Home_shope extends StatefulWidget {
  final String phone;

  Home_shope({super.key, required this.phone});

  @override
  State<Home_shope> createState() => _Home_shopeState();
}

class _Home_shopeState extends State<Home_shope> {
  String storeName = 'مرحباً، متجر تجريبي'; // اسم افتراضي
  String phoneForNavigation = ''; // رقم هاتف للتنقل

  @override
  void initState() {
    super.initState();
    // بدلاً من فايربيز هخليها قيم ثابتة
    phoneForNavigation = widget.phone;
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
          automaticallyImplyLeading: false, // إزالة زر الرجوع
          title: Text(
            storeName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            /*NotificationBadgeIcon(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        nofication_shope(phone: phoneForNavigation),
                  ),
                );
              },
            ),*/
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _buildCard(
                              context: context,
                              title: 'طلب أوردر جديد',
                              icon: Icons.sync,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 12),
                            _buildCard(
                              context: context,
                              title: 'الطلبات السابقة',
                              icon: Icons.description_outlined,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          children: [
                            _buildCard(
                              context: context,
                              title: 'الطلبات الجارية',
                              icon: Icons.inventory_2_outlined,
                              color: Colors.amber,
                            ),
                            const SizedBox(height: 12),
                            _buildCard(
                              context: context,
                              title: 'تقارير',
                              icon: Icons.bar_chart,
                              color: Colors.green.shade800,
                            ),
                            const SizedBox(height: 12),
                            _buildCard(
                              context: context,
                              title: 'البروفايل',
                              icon: Icons.person,
                              color: Colors.indigo,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
  }) {
    final isSpecial = title == 'الطلبات الجارية';

    return GestureDetector(
     /* onTap: () {
        switch (title) {
          case 'طلب أوردر جديد':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewOrdersScreen(phone: phoneForNavigation),
              ),
            );
            break;
          case 'الطلبات السابقة':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    previousordersscreen_shope(phone: phoneForNavigation),
              ),
            );
            break;
          case 'الطلبات الجارية':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    order_detailes_shope(phone: phoneForNavigation),
              ),
            );
            break;
          case 'البروفايل':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => shope_profile(phone: phoneForNavigation),
              ),
            );
            break;
          case 'تقارير':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => report_shope(phone: phoneForNavigation),
              ),
            );
            break;
        }
      },*/
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 90,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 28,
                color: isSpecial ? Colors.black : Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isSpecial ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
