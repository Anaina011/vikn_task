import 'package:flutter/material.dart';

class SalesList extends StatelessWidget {
  const SalesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Sales Estimate",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Color(0xff0A9EF3),
              ))
        ],
      ),
      body: Column(
        children: [
          _mySearchBar(),
          _mySalesList(),
        ],
      ),
    );
  }

  Widget _mySearchBar() {
    return const TextField(
      decoration: InputDecoration(
          fillColor: Color(0xffFBFBFB),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          hintText: "Search",
          suffixIcon: Icon(Icons.search)),
    );
  }

  Widget _mySalesList() {
    return Expanded(
        child: Container(
      height: 10,
      color: Colors.white,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 4, //todo item in search
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListTile(
            title: Text(
              "#Invoice No",
              style: TextStyle(fontSize: 13),
            ),
            subtitle: Text(
              "Customer Name",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Pending",
                  style: TextStyle(color: Colors.red, fontSize: 13),
                ),
                Text(
                  "SAR. 10,000.00",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
