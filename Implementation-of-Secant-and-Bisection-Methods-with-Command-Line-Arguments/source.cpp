#include <iostream>
#include <cmath>
using namespace std;

class Polynomial{ 
	private:
	int power;
	
	public:
		float* coefficients; // coefficients of polynomial
		Polynomial(); // constructor of class
		~Polynomial(); //class destructor
		int getPower(){return power;} //return power of polynomial
		void setPower(int a); // setting power 
		float polyResult(float x); //calculate polynomial from a given input value
		void bisectionMethod(float numberA,float numberB,float tolerans,float m,float &numberATemp,float &numberBTemp);// Bisection method that also gives outputs as an input of hybrid method.
		void secantMethod(float numberA,float numberB,float tolerans); // Secant method
		void hybridMethod(float numberA,float numberB,float tolerans);// hybrid method
};
Polynomial::Polynomial(){
	coefficients = new float[power+1];
}
Polynomial::~Polynomial(){
	delete [] coefficients;
}
void Polynomial::setPower(int a){
	power = a;
}
float Polynomial::polyResult(float x){ // Calculation of given value in polynomial
		float sum = 0;
		int j = getPower();
		for(int i=0;i < getPower()+1; i++){
			sum += coefficients[i] * pow(x,j);
			j--;
		}
		return sum;
}
void Polynomial::bisectionMethod(float numberA,float numberB,float tolerans,float m,float &numberATemp,float &numberBTemp){
		float fa = polyResult(numberA); //calculate f(a)
		float fb = polyResult(numberB);//calculate f(b)
		float fm = polyResult(m); //calculate f(m)
		int counter=1;

		if(fa==0){  	// from line 44 - 49, these if cases are made for if anyone of the function of initial guesses are given as zero
			m=0;
			counter=1;
		}else if(fb==0){
			m=0;
			counter=1;
		}else{
			while(abs(numberA - m) > tolerans){ 		//main algorithm of bisection
				fa = polyResult(numberA);		//i set again and again f(a) f(b) and f(m), because i always need new calculated value of these. line 52-54
				fb = polyResult(numberB);
				fm = polyResult(m); 
				if((fa > 0 && fm >  0) || (fa < 0 && fm < 0)){
					numberA = m;
				}else{
					numberB = m;
				}
				m = (numberA + numberB)/2;
				counter++;
				if(counter==2){ // define temporary values of 2nd iteration to use in hybrid method inputs
					numberATemp=numberA;
					numberBTemp=numberB;
				}
			}
		}
		cout << "Bisection Result ----> "<< m << " || Bisection Iteration Number -----> " << counter << endl; //print out output of bisection of this method
}
void Polynomial::secantMethod(float numberA,float numberB,float tolerans){ // Secant method
	int counter = 0;
	float temp=0;
	while(abs(numberA - numberB) > tolerans){ // general iteration algorithm of secant method
		temp=numberA-(polyResult(numberA))*(numberA-numberB)/(polyResult(numberA)-polyResult(numberB));
		numberA = numberB;
		numberB = temp;
		counter++;
	}
	cout << "Secant Result -------> "<<(numberA/2 + numberB/2) << " || Secant Iteration Number --------> " << counter << endl;//print out output of secant of this method
}
void Polynomial::hybridMethod(float numberA,float numberB,float tolerans){ //hybrid method , get input from bisection method after 2nd iteration
	int counter = 2;
	float temp=0;
	while(abs(numberA - numberB) > tolerans){ // general iteration algorithm of hybrid method
		temp=numberA-(polyResult(numberA))*(numberA-numberB)/(polyResult(numberA)-polyResult(numberB));
		numberA = numberB;
		numberB = temp;
		counter++;
	}
	cout << "Hybrid Result -------> "<<(numberA/2 + numberB/2) << " || Hybrid Iteration Number --------> " << counter << endl;//print out output of hybrid of this method
}

int main(int argc, char const *argv[]){
	if( argc < 5){ // If there are less then 5 command line arguments
		cout<<" 5 command line arguments are necessary that ===> 3 or more for coefficients and ===> 2 for initial guesses and ===> 1 for tolerance! ";
	}else{ 
		if(atof(argv[argc-3])<atof(argv[argc-2])){ //initial guesses x2 < x1 => program doesn't work
			Polynomial alparslan; // alparslan object in polynomial class to keep coeffs of polynomial and calculate these iteration operations for different methods.
			float atemp=0,btemp=0; // temprory values to use in hybrid method
			alparslan.setPower(argc-5); //power of input polynomial that we set from command line arguments
		
		for(int i = 1; i <= (argc-5)+1; i++){
			alparslan.coefficients[i-1] = atof(argv[i]); //coeffs
		}
		
		float guess1 = atof(argv[argc-3]); //set initial guess 1
		float guess2 = atof(argv[argc-2]);//set initial guess 2
		float tolerans = atof(argv[argc-1]);//set tolerance
		float M = guess1 + (guess2 - guess1)/2; //calculate midpoint form these calculation from our course book.
		
		alparslan.bisectionMethod(guess1,guess2,tolerans,M,atemp,btemp); //bisection method , gives output of 2 values that will be used in hybrid method.
		guess1 = atof(argv[argc-3]); // to use hybrid method input, program keeps 2 values from output of bisection method after second iteration and sets these temps to guess variables 
		guess2 = atof(argv[argc-2]);
		alparslan.secantMethod(guess1,guess2,tolerans); // Secant Method
		alparslan.hybridMethod(atemp,btemp,tolerans); // Hybrid Method
		}else{ 
		cout<<"X2 > X1 ======> so program does not work in this condition you have to set guesses as X1 > X2";
		}
	}
return 0;
}
