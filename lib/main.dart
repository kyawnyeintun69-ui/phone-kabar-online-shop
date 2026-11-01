
import 'package:flutter/material.dart';

void main() {
  runApp(const PhoneKabarApp());
}

class PhoneKabarApp extends StatelessWidget {
  const PhoneKabarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone Kabar OnlineShop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool isMyanmar = true;

  final List<Map<String, String>> products = [
    {
      'name': 'Smart Phone',
      'price': '350,000 Ks',
      'icon': '📱',
    },
    {
      'name': 'Headphones',
      'price': '45,000 Ks',
      'icon': '🎧',
    },
    {
      'name': 'Smart Watch',
      'price': '85,000 Ks',
      'icon': '⌚',
    },
    {
      'name': 'Accessories',
      'price': '15,000 Ks',
      'icon': '🔌',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text(
          'ဖုန်းကမ္ဘာ OnlineShop',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isMyanmar = !isMyanmar;
              });
            },
            icon: const Icon(Icons.language),
            tooltip: 'Change language',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          homeScreen(),
          simplePage(
            isMyanmar ? 'ဆိုင်များ' : 'Shops',
            Icons.store,
          ),
          simplePage(
            isMyanmar ? 'ဈေးဝယ်ခြင်း' : 'Shopping Cart',
            Icons.shopping_cart,
          ),
          simplePage(
            isMyanmar ? 'ကျွန်ုပ်၏အကောင့်' : 'My Account',
            Icons.person,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            label: isMyanmar ? 'ပင်မ' : 'Home',
          ),
          NavigationDestination(
            icon: const Icon(Icons.store_outlined),
            label: isMyanmar ? 'ဆိုင်များ' : 'Shops',
          ),
          NavigationDestination(
            icon: const Icon(Icons.shopping_cart_outlined),
            label: isMyanmar ? 'ခြင်း' : 'Cart',
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            label: isMyanmar ? 'အကောင့်' : 'Account',
          ),
        ],
      ),
    );
  }

  Widget homeScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isMyanmar
                      ? 'ဖုန်းကမ္ဘာမှ ကြိုဆိုပါတယ်'
                      : 'Welcome to Phone Kabar',
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isMyanmar
                      ? 'ကြိုက်တာရွေး၊ အိမ်အရောက်မှာယူပါ။'
                      : 'Shop your favorites and get home delivery.',
                ),
                const SizedBox(height: 12),
                const Icon(
                  Icons.shopping_bag,
                  size: 48,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text(
            isMyanmar ? 'ကုန်ပစ္စည်းအမျိုးအစားများ' : 'Categories',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              categoryChip('📱 Phone'),
              categoryChip('🎧 Audio'),
              categoryChip('⌚ Watch'),
              categoryChip('🔌 Accessories'),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            isMyanmar ? 'အရောင်းပစ္စည်းများ' : 'Products',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.95,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product['icon']!,
                        style: const TextStyle(fontSize: 42),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        product['price']!,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FilledButton(
                        onPressed: () {},
                        child: Text(
                          isMyanmar ? 'ကြည့်ရန်' : 'View',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Payment: KBZPay | WavePay | Bank Transfer',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget categoryChip(String name) {
    return Chip(
      backgroundColor: Colors.green.shade50,
      label: Text(name),
    );
  }

  Widget simplePage(String title, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 65, color: Colors.green),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
