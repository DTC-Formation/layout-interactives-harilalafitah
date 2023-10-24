import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  } // Listes des technologies

  var hobbyCtrl = TextEditingController();
  String? hobby; //Hobbies

  double? height;
  double? weight;
  double? bmi;
  double? bmiResult;
  String? textCalcul;
  String? bmiConclusion;
  double? heightInMeters;
  double? heightInCm;
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
  } // BMI, poids et taille

  double _sliderValue = 0;

  String? path;
  Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }

  pickedFile() async {
    final pickedFile = await pickImage();
    if (pickedFile != null) {
      setState(() {
        path = pickedFile.path;
      });
    }
  } //Profil image

  String? pathCover;
  Future<XFile?> pickImageCover() async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }

  pickedFileCover() async {
    final pickedFile = await pickImageCover();
    if (pickedFile != null) {
      setState(() {
        pathCover = pickedFile.path;
      });
    }
  } //Cover image

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
              alignment: AlignmentDirectional.topStart,
              children: [
                pathCover != null
                    ? Image.file(
                        File(pathCover!),
                        fit: BoxFit.cover,
                        width: size.width,
                        height: 200,
                      )
                    : Image.asset(
                        'assets/images/basic.jpg',
                        fit: BoxFit.fill,
                        width: size.width,
                        height: 200,
                      ), //Cover image
                const Padding(
                  padding: EdgeInsets.only(top: 195),
                  child: Divider(
                    height: 10,
                    thickness: 5,
                    endIndent: 0,
                    indent: 0,
                    color: Colors.indigo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 95, left: 20),
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: path != null
                          ? DecorationImage(
                              image: FileImage(File(path!)), fit: BoxFit.cover)
                          : const DecorationImage(
                              image: AssetImage('assets/images/Crystal.jpg'),
                              fit: BoxFit.cover),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100.0)),
                      border: Border.all(
                        color: Colors.blue,
                        width: 4.0,
                      ),
                    ),
                  ),
                ), //Profil image
                Padding(
                  padding: const EdgeInsets.only(top: 185, left: 130),
                  child: IconButton.filled(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black54),
                      overlayColor: MaterialStatePropertyAll(Colors.black87),
                    ),
                    onPressed: () {
                      pickedFile();
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                    ),
                  ),
                ), //profil image button
                Padding(
                  padding: const EdgeInsets.only(top: 155, left: 205),
                  child: SizedBox(
                    height: 30,
                    child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black45),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white70),
                          overlayColor:
                              const MaterialStatePropertyAll(Colors.black54),
                          shadowColor:
                              const MaterialStatePropertyAll(Colors.black45),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        onPressed: () {
                          pickedFileCover();
                        },
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Edit cover photo')),
                  ),
                ), //Cover image button
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
                                text: 'Height(cm): ',
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
                                text: 'weight(kg): ',
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
                                    Slider(
                                      value: _sliderValue,
                                      max: 230,
                                      divisions: 230,
                                      label: _sliderValue.round().toString(),
                                      onChanged: (double value) {
                                        setState(() {
                                          _sliderValue = value;
                                          heightInCm = _sliderValue;
                                        });
                                      },
                                      activeColor: Colors.blue,
                                      inactiveColor: Colors.grey,
                                    ),
                                    Text(
                                        'Height(in cm): ${heightInCm?.round().toString() ?? "n/a"}'),
                                    const SizedBox(height: 20),
                                    TextField(
                                      controller: poidsCtrl,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        labelText: 'Your weight(in kg)',
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
                              style: const ButtonStyle(
                                elevation: MaterialStatePropertyAll(5),
                              ),
                              onPressed: () {
                                setState(() {
                                  heightInMeters = heightInCm! / 100;
                                  height = heightInMeters;
                                  if (height != null && weight != null) {
                                    textCalcul = 'BMI calcul done!';
                                  } else {
                                    textCalcul = 'Missing informations!';
                                  }
                                });
                              },
                              child: const Text('Calculate'),
                            ),
                            Text(
                              textCalcul ?? "Nothing yet!",
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
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Click "send" when your done!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.blueAccent),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.blue),
                        elevation: const MaterialStatePropertyAll(5),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        )),
                    onPressed: () {
                      setState(() {
                        nom = nomCtrl.text;
                        prenom = prenomCtrl.text;
                        getAge();
                        hobby = hobbyCtrl.text;
                        getCheckboxItem();
                        gender = genderValue;
                        taille = heightInCm!.round().toString();
                        poids = poidsCtrl.text;

                        getBmiConclusion();
                        bmiResult = bmi;
                      });
                    },
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
