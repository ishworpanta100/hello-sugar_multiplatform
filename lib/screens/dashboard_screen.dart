import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/header.dart';
import 'add_data_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDataScreen(),
                    ),
                  );
                },
                child: const Text('Add Data'),
              ),
            ),
            const SizedBox(height: 20),
            _buildUpcomingAppointments(),
            const SizedBox(height: 20),
            _buildVouchers(),
            const SizedBox(height: 20),
            _buildBookAgain(),
            const SizedBox(height: 20),
            _buildMembershipSavings(),
            const SizedBox(height: 20),
            _buildFeaturedServices(),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Upcoming Appointments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Card(
          color: Colors.pink[100],
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.pink),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tuesday, 04:30pm', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Female Brazilian Wax'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVouchers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Your Vouchers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildVoucherCard('Brazilian Wax x3'),
            const SizedBox(width: 10),
            _buildVoucherCard('Brazilian Wax x5'),
          ],
        ),
      ],
    );
  }

  Widget _buildVoucherCard(String title) {
    return Expanded(
      child: Card(
        color: Colors.pink[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const FlutterLogo(size: 50),
              const SizedBox(height: 10),
              Text(title),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(foregroundColor: Colors.pink),
                child: const Text('Book Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookAgain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Book Again', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _buildServiceCard('Brazilian Enzyme Treatment'),
      ],
    );
  }

  Widget _buildServiceCard(String title) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FlutterLogo(size: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text('\$150 • 60 min'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  child: const Text('Book Appointment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipSavings() {
    return Card(
      color: Colors.pink[50],
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Membership Savings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Your Savings', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('\$25,000', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.pink)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Featured Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildFeaturedServiceCard('Brazilian Enzyme Treatment'),
            const SizedBox(width: 10),
            _buildFeaturedServiceCard('Brazilian Enzyme Treatment'),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturedServiceCard(String title) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            const FlutterLogo(size: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
