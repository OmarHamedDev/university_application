import 'package:flutter/material.dart';

class AddRequests extends StatelessWidget {
  const AddRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Add new request",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name"),
            const SizedBox(height: 6),
            TextField(
              controller: nameController,
              decoration: _inputDecoration(),
            ),
            const SizedBox(height: 16),

            const Text("Price"),
            const SizedBox(height: 6),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: _inputDecoration(),
            ),
            const SizedBox(height: 16),

            const Text("Description"),
            const SizedBox(height: 6),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: _inputDecoration(),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Create Button
                ElevatedButton(
                  onPressed: () {
                    // تنفيذ الحفظ هنا
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Create",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // Cancel Button
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Cancel"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
