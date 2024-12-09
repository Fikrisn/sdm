import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sdm/models/dosen/user_model.dart';
import 'package:sdm/models/dosen/statistik_model.dart';
import 'package:sdm/widget/dosen/custom_bottomappbar.dart';

class DetailprofilePage extends StatelessWidget {
  final UserModel userData;
  final StatistikModel? statistikData;

  const DetailprofilePage({
    super.key,
    required this.userData,
    this.statistikData,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Detail Profil',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: screenWidth * 0.05,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 103, 119, 239),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey
            ),
            const SizedBox(height: 15),
            Text(
              userData.nama,
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              userData.email,
              style: GoogleFonts.poppins(
                color: Colors.grey[600],
                fontSize: screenWidth * 0.035,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 5, 167, 170),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Detail Profil',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailField('Nama', userData.nama),
                          const SizedBox(height: 16),
                          _buildDetailField('Email', userData.email),
                          const SizedBox(height: 16),
                          _buildDetailField('NIP', userData.nip),
                          const SizedBox(height: 16),
                          _buildDetailField('Level', userData.level),
                          const SizedBox(height: 16),
                          _buildDetailField(
                            'Tanggal Lahir',
                            DateFormat('dd MMMM yyyy').format(userData.tanggalLahir),
                          ),
                          const SizedBox(height: 16),
                          _buildDetailField(
                            'Total Poin',
                            (statistikData?.totalPoin ?? 0.0).toString(),
                          ),
                          if (userData.jabatan.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            _buildDetailField(
                              'Jabatan',
                              userData.jabatan.join(', '),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomBottomAppBar().buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(currentPage: 'profile'),
    );
  }

  Widget _buildDetailField(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}