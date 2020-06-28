#include <iostream>
using namespace std;

void write_results(const char* s1, const char* s2);
int main() {
	char str1[]= "A very long sentence";

	char str2[] = "Another not so short sentence";
	write_results(str1,str2);
}

void write_results(const char* str1, const char* str2){
	int size_of_str1=0;
	int size_of_str2=0;
	char temp;
	
	for(int i=0;i < i+1;i++){

		if(str1[i] != '\0'){
			size_of_str1++;
		}else
			break;
	}
	for(int i=0;i < i+1;i++){
		if(str2[i] != '\0'){
		
			size_of_str2++;
		}else
			break;
	}

	char string1[size_of_str1];
	char string2[size_of_str2];
	for(int i=0;i<size_of_str1;i++){	
			string1[i]=str1[i];
	}
	for(int i=0;i<size_of_str2;i++){
			string2[i]=str2[i];
	}
	
	for(int i=0;i < size_of_str1-1;i++){
		for(int j = i+1; j < size_of_str1; j++){
			if (string1[i] > string1[j]){
				temp = string1[i];
				string1[i] = string1[j];
				string1[j] = temp;
			}
		}
	}

	for(int i=0;i < size_of_str2-1;i++){
		for(int j = i+1; j < size_of_str2; j++){
			if (string2[i] > string2[j]){
				temp = string2[i];
				string2[i] = string2[j];
				string2[j] = temp;
			}
		}
	}

		bool checker;
		char ch;
	for(int i=0;i<size_of_str1;i++){
		checker= true;
		
		for(int k=i+1;k<size_of_str1;k++){
			if(string1[i]==string1[k] || string1[i]== ' ' ){
				checker = false;
				break;
			}
		}
		if (checker == true) {
			for(int j=0;j<size_of_str2;j++){	
				if(string1[i]==string2[j]){

					if(string1[i]<97){
						ch=string1[i]+32;
					}else{
						ch=string1[i];
					}	
					cout <<ch<<" ";
					checker =false;
					break;
				}
			}
		}	
	}
	cout <<""<< endl;
	
	for(int i=0;i<size_of_str1;i++){
		checker= true;
			
			
		for(int j=0;j<size_of_str2;j++){	
			if((string1[i]==string2[j] || string1[i]== ' ')&& checker==true){	
				checker =false;
				break;
			}
		}
		if(checker==true){
		
			if(string1[i]<97){
					ch=string1[i]+32;
				}else{
					ch=string1[i];
				}
			cout<<string1[i]<<" ";
		}
	}
	
}
