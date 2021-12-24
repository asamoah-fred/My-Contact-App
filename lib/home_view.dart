import 'package:awesome_contact_app/contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_model.dart';

class Homeview extends StatelessWidget {
  Homeview({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Micheal Asamoah",
      "phone": "+233 551 80 6883",
      "email": "michealasamoah70@gmail.com",
      "region": "Central Region",
      "country": "Ghana",
      "picture": "assets/fam.jpg"
    },
    {
      "name": "Simon Okrah",
      "phone": "+233 555 97 5670",
      "email": "simonokrah432@gmail.com",
      "region": "Greater Accra",
      "country": "Ghana",
      "picture": "assets/zaza.jpg"
    },
    {
      "name": "Lovely Mum",
      "phone": "+233 553 39 9721",
      "email": "lydiaosei@gmail.com",
      "region": "Kumasi",
      "country": "Ghana",
      "picture": "assets/mum.jpg"
    },
    {
      "name": "Asamoah Yaw",
      "phone": "+233 243 72 2289",
      "email": "yawasamoah1965@gmail.com",
      "region": "Volta Region",
      "country": "Ghana",
      "picture": "assets/nana.jpg"
    },
    {
      "name": "Asamoah Godfred",
      "phone": "+233 247 17 2944",
      "email": "asamoahgodfred42@gmail.com",
      "region": "Western RegionGhana",
      "country": "Ghana",
      "picture": "assets/me.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/me.jpg'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text(
                'Recent',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'michaelasamoah70@gmail.com',
                                name: 'Michael Asamoah',
                                phone: '+233 551 80 6883',
                                region: 'Greater Accra',
                                picture: ''));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/fam.jpg'),
                    ),
                    title: const Text(
                      'Michael Asamoah',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 551 80 6883'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ContactDetailsView(
                              contact: contact,
                            );
                          },
                        ));
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("${element['picture']}"),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.more_horiz),
                      ),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },

              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Color(0xff1A4ADA),
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
