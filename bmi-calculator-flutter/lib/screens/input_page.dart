import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
enum Gender {male,female,}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
Gender selectedGender;
int height =180;
int weight=60;
int age =20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child:Row(
            children: [
              Expanded(child: ReusableCard(
                onPress:()
               {
              setState(() {
               selectedGender=Gender.male;
               });
               },

                cardChild: iconContent(userIcon: FontAwesomeIcons.mars,label: 'MALE',),
                  colour: selectedGender==Gender.male?kactiveCardColor:kinactiveCardColor),),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                },
                cardChild: iconContent(userIcon: FontAwesomeIcons.venus,label: 'FEMALE',),
                  colour: selectedGender==Gender.female?kactiveCardColor:kinactiveCardColor),),
            ],
          )),
        Expanded(child:ReusableCard(
            colour: kactiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'HEIGHT', 
              style: klabelTextSyle,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                height.toString(),
                style: kNumberTextStyle,
              ),
              Text(
                'cm',
                style: klabelTextSyle,
              )
            ],
          ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor :Color(0xFF8D8E98) ,
                thumbColor: Color(0xFFEB1555),
                activeTrackColor: Colors.white,
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius:15.0,),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0, ),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 120.0,
                max: 220.0,
                onChanged: (double newValue){
                  setState(() {
                    height=newValue.toInt();
                  });
                },
               


              ),
            ),
          ],
        ),),
        ),

        Expanded(
          child: Row(
            children: [
              Expanded(child:ReusableCard(
                  colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('WEIGHT',
                  style: klabelTextSyle,),
                  Text(weight.toString(),
                  style: kNumberTextStyle,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [RoundIconButton(icon: FontAwesomeIcons.plus ,
                   onPressed: (){
                     setState(() {
                       ++weight;
                     });
                   },),
                     SizedBox(
                       width: 10.0,
                     ),
                     RoundIconButton(
                      icon:FontAwesomeIcons.minus ,
                      onPressed: (){
                        setState(() {
                          --weight;
                        });
                      },
                     ),
                   ],
                 ),
                ],
              ),)
              ),
              Expanded(child: ReusableCard(
                  colour: kactiveCardColor,
              cardChild:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AGE',
                    style: klabelTextSyle,),
                  Text(age.toString(),
                    style: kNumberTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [RoundIconButton(icon: FontAwesomeIcons.plus ,
                      onPressed: (){
                        setState(() {
                          ++age;
                        });
                      },),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                        icon:FontAwesomeIcons.minus ,
                        onPressed: (){
                          setState(() {
                            --age;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),),),
            ],
          ),
        ),
          BottomButton(buttonTitle: 'CALCULATE',onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
            Navigator.push(context,MaterialPageRoute(builder:(context) => ResultsPage(
              bmiResult:calc.calculateBMI() ,
              resultText:calc.getResult() ,
              interpretation:calc.getInterpretation() ,
            )) );
    },
          )
        ],
      ),
    );
  }
}




