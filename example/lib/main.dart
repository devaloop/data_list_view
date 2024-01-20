import 'package:devaloop_data_list_view/data_list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data List View',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          color: Colors.grey.shade100,
          child: Card(
            elevation: 0,
            color: Colors.white,
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DataListView(
                title: 'Clinical Checkups',
                dataSource: DataSource(
                  dataItems: [
                    DataItem(
                      title: 'Blood Complete',
                      subtitle: const Text('Blood check up complete'),
                      onTap: () {},
                    ),
                    DataItem(
                      title: 'ACA IgG',
                      subtitle: const Text(
                          'Cardiolipin antibodies (ACA) are autoantibodies produced by the body\'s immune system which mistakenly attacks cardiolipin, a substance found in the outer layer of cells (cell membranes) and platelets. These autoantibodies can affect the body\'s ability to regulate blood clotting.'),
                      onTap: () {},
                    ),
                    DataItem(
                      title: 'ACA IgM',
                      subtitle: const Text(
                          'Cardiolipin antibodies (ACA) are autoantibodies produced by the body\'s immune system which mistakenly attacks cardiolipin, a substance found in the outer layer of cells (cell membranes) and platelets. These autoantibodies can affect the body\'s ability to regulate blood clotting.'),
                      onTap: () {},
                    ),
                    DataItem(
                      title: 'Anti-Beta2-Glikoprotein 1',
                      subtitle: const Text(
                          'Anti-β2 Glycoprotein 1 is the main protein that binds to phospholipid and cardiolipin antibodies.'),
                      onTap: () {},
                    ),
                    DataItem(
                      title: 'APTT',
                      subtitle: const Text(
                          'Activated partial thromboplastin time (APTT) is a laboratory test to assess the activity of intrinsic and common pathway coagulation factors, namely factor factor IX (Christmas factor), factor VIII (antihemophilic factor, AHF), factor X (Stuart factor), factor V (proaccelerin), factor II (prothrombin) and factor I (fibrinogen). This test is for monitoring heparin therapy or the presence of circulating anticoagulant. The APTT is prolonged due to a deficiency of intrinsic coagulation factors and if the level is <> 7 seconds from the normal value, then the examination results are considered abnormal.'),
                      onTap: () {},
                    ),
                    DataItem(
                      title: 'AT III',
                      subtitle: const Text(
                          'Antithrombin III (ATIII) is a vitamin K-independent protease that inhibits coagulation by neutralizing the activity of thrombin enzymes (factors IIa, IXa, Xa). Antithrombin III activity is markedly potentiated by heparin, the primary mechanism by which heparin and low molecular weight heparins produce anticoagulation.'),
                      onTap: () {},
                    ),
                    DataItem(
                      title: 'CD 34',
                      subtitle: const Text(
                          'CD34 is a protein found in living creatures such as humans, mice, rats and other species. Even though it is found in the body, such as in the bone marrow, blood vessel lining and certain cells, CD34 is also found in several types of tumor cells.'),
                      onTap: () {},
                    ),
                    DataItem(
                      title: 'Colestrol',
                      subtitle: const Text('Blood checkup complete'),
                      onTap: () {},
                    ),
                    DataItem(
                      title: 'Colestrol',
                      subtitle: const Text('Blood checkup complete'),
                      onTap: () {},
                    ),
                    DataItem(
                      title: 'Colestrol',
                      subtitle: const Text('Blood checkup complete'),
                      onTap: () {},
                    ),
                  ],
                  totalData: 20,
                  dataHeader: [
                    'Clinical Checkup Name',
                    'Detail',
                  ],
                ),
                actions: [
                  ActionButton(
                    onPressed: () {},
                    label: 'Add',
                    icon: const Icon(Icons.add),
                    showForward: true,
                  ),
                  ActionButton(
                    onPressed: () {},
                    label: 'Search',
                    icon: const Icon(Icons.search),
                    showForward: true,
                  ),
                  ActionButton(
                    onPressed: () {},
                    label: 'Refresh',
                    icon: const Icon(Icons.refresh),
                    showForward: true,
                  ),
                  ActionButton(
                    onPressed: () {},
                    label: 'Categories',
                    icon: const Icon(Icons.category),
                  ),
                  ActionButton(
                    onPressed: () {},
                    label: 'Type',
                    icon: const Icon(Icons.type_specimen),
                  ),
                ],
                summaries: const [
                  Summary(
                    value: '0',
                    label: 'Added Today',
                  ),
                  Summary(
                    value: '5',
                    label: 'Added',
                  ),
                  Summary(
                    value: '15',
                    label: 'Updated',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
