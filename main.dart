import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Information',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nomCtrl = TextEditingController();
  String? nom; //Nom

  var prenomCtrl = TextEditingController();
  String? prenom; //Prenom

  int _value = 0;
  String? genderValue;
  String? gender; //Gender

  var tailleCtrl = TextEditingController(); //Taille
  String? taille;
  var poidsCtrl = TextEditingController();
  String? poids;

  var ageCtrl = TextEditingController();
  String? age; //Age
  getAge() {
    var ageSplit = ageCtrl.text.split(' ');
    var ageCalc = 2023 - int.parse(ageSplit[2]);
    age = ageCalc.toString();
  }

  Map<String, bool> techno = {
    'Flutter': false,
    'Javascript': false,
    'HTML5': false,
    'Python': false,
    'PHP': false,
    'Go Lang': false,
  };
  List technologies = [];
  getCheckboxItem() {
    technologies.clear();
    techno.forEach((key, value) {
      (value == true) ? technologies.add(key) : technologies.remove(key);
    });
  }

  var hobbyCtrl = TextEditingController();
  String? hobby;

  double? height;
  double? weight;
  double? bmi;
  double? bmiResult;
  String? textCalcul;
  String? bmiConclusion;
  getBmiConclusion() {
    if (height != null && weight != null) {
      bmi = weight! / (height! * height!);
    }
    if (bmi! <= 18.5) {
      bmiConclusion = 'You are underweight';
    } else if (bmi! > 18.5 && bmi! <= 25) {
      bmiConclusion = 'You are normal';
    } else if (bmi! > 25 && bmi! <= 30) {
      bmiConclusion = 'You are overweight';
    } else if (bmi! > 30) {
      bmiConclusion = 'You suffer of Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image(
                  image: const AssetImage('assets/images/basic.jpg'),
                  fit: BoxFit.fill,
                  width: size.width,
                  height: 170,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 165),
                  child: Divider(
                    height: 10,
                    thickness: 5,
                    endIndent: 0,
                    indent: 0,
                    color: Colors.indigo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Crystal.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100.0)),
                      border: Border.all(
                        color: Colors.blue,
                        width: 4.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Name: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                            text: nom ?? "n/a",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: 'First name: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                            text: prenom ?? 'n/a',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Age: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                            text: age ?? 'n/a',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 70),
                    Text.rich(
                      TextSpan(
                        text: 'Gender: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                            text: gender ?? 'n/a',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Card(
                  color: const Color.fromARGB(255, 237, 242, 244),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        const Text(
                          'Body Mass Index(B.M.I):',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Height: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                                children: [
                                  TextSpan(
                                    text: taille ?? 'n/a',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 55),
                            Text.rich(
                              TextSpan(
                                text: 'weight: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                                children: [
                                  TextSpan(
                                    text: poids ?? 'n/a',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'B.M.I results:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black54,
                                  ),
                                ),
                                if (bmi != null)
                                  Text(
                                    '${bmiResult?.toStringAsFixed(2)}  kg/m2',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Colors.indigo,
                                    ),
                                  ),
                              ],
                            ),
                            if (bmi != null)
                              Text(
                                '$bmiConclusion',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.blueGrey,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text.rich(
                  TextSpan(
                    text: 'Technology list: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                    children: [
                      TextSpan(
                        text: technologies.join(",  "),
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'Hobbies: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                    children: [
                      TextSpan(
                        text: hobby ?? 'n/a',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 30,
              endIndent: 30,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Enter your information below.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Your name and first name.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: nomCtrl,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: prenomCtrl,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'Enter your first name',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Your birth date.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: ageCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your birth date',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Gender:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                              genderValue = 'Man';
                            });
                          },
                        ),
                        const Text('Man'),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                              genderValue = 'Woman';
                            });
                          },
                        ),
                        const Text('Woman'),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Technology list.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 175,
                  child: Card(
                    color: const Color.fromARGB(255, 237, 242, 244),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: techno.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(key),
                            value: techno[key],
                            activeColor: Colors.pink,
                            checkColor: Colors.white,
                            onChanged: (bool? value) {
                              setState(() {
                                techno[key] = value!;
                              });
                            },
                          );
                        }).toList(growable: false),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Get your BMI using your weight and height.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 237, 242, 244),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 30),
                              child: SizedBox(
                                width: 200,
                                child: Column(
                                  children: [
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      controller: tailleCtrl,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText:
                                            'Enter your height(in meters)',
                                      ),
                                      onChanged: (value) {
                                        height = double.tryParse(value);
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    TextField(
                                      controller: poidsCtrl,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText:
                                            'Enter your weight(in kilograms)',
                                      ),
                                      onChanged: (value) {
                                        weight = double.tryParse(value);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (height != null && weight != null) {
                                    textCalcul = 'BMI calcul done!';
                                  }
                                });
                              },
                              child: const Text('Calculate'),
                            ),
                            Text(
                              textCalcul ?? "Missing informations!",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Your Hobbies.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 30,
                  ),
                  child: TextField(
                    controller: hobbyCtrl,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'What are/is your hobbies?'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 35, top: 15),
              child: Text(
                'Click "send" when your done!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            nom = nomCtrl.text;
            prenom = prenomCtrl.text;
            getAge();
            hobby = hobbyCtrl.text;
            getCheckboxItem();
            gender = genderValue;
            taille = tailleCtrl.text;
            poids = poidsCtrl.text;

            getBmiConclusion();
            bmiResult = bmi;
          });
        },
        label: const Text('Send'),
      ),
    );
  }
}
