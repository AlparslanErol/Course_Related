#include <iostream>
#include <vector>
#include <cstring>
#include <string>
#include <fstream>
#include <cstdlib>
#include <ctime>
#include <map>
#include <limits>
#include <typeinfo>
#include <cmath>
#include <iomanip>

using namespace std;


class Matrix{
public:
	Matrix(string filename);//one parameter constructor
	Matrix(int row,int column);
	double** table;
	void divide(int num,string line);// for divide each line in file
	inline int getRow(){return row;}
	inline int getColumn(){return column;}
	void setRow(int row);
	void setColumn(int column);
	Matrix operator -(Matrix& otherObject);
	const Matrix& operator = (const Matrix& otherObject);
	Matrix operator *(Matrix& otherObject);
	void powerIterationDeflation(string filename,double tolerans);
	Matrix transpose();
	void findSecondEigenValue(string filename, double tolerans);

private:
	int row;
	int column;

};
Matrix::Matrix(int row,int column){
	this->row = row;
	this->column = column;

	table = new double* [row];
	for (int i = 0; i < row; i++){
		table[i] = new double[column];
	}

}
Matrix::Matrix(string filename){
	string line;
	int counter = 0;

	ifstream myfile;
	myfile.open(filename.c_str());
	if(myfile.is_open()){
    	while(!myfile.eof()){
    		getline(myfile,line);
    		counter++;
    	}

        myfile.close();
    }else{
      cerr << "Error opening" << endl;
      exit(1);
  	}
  	setColumn(counter);
  	setRow(counter);

  	table = new double*	[counter];
  	for(int i = 0 ; i < counter ; i++){
  		table[i] = new double[counter];
  	}

  	counter = 0;
  	myfile.open(filename.c_str());
	if(myfile.is_open()){
    	while(!myfile.eof()){
    		getline(myfile,line);
    		divide(counter,line);
    		counter++;
    	}

        myfile.close();
    }else{
      cerr << "Error opening" << endl;
      exit(1);
  	}
}
void Matrix::setRow(int row){
	this->row = row;
}
void Matrix::setColumn(int column){
	this->column = column;
}
void Matrix::divide(int num,string line){
	char* token;
	int i=0;

	token = strtok(&line[0]," ");
	while( token != NULL ){
		table[num][i] = atof(token);
		i++;
		token = strtok(NULL," ");
	}
}
Matrix Matrix::operator -(Matrix& otherObject){
	if(getRow() != otherObject.getRow()){
		cout << "Error in subtract !!!!! " << endl;
	}else{
		for(int i = 0 ; i < getRow() ; i++){
			for(int j = 0 ; j < getColumn() ; j++){
				table[i][j] =  table[i][j] - otherObject.table[i][j];
			}
		}
	}
	return *this;
}
const Matrix& Matrix::operator = (const Matrix& otherObject){
		for(int i = 0 ; i < getRow(); i++){
			for(int j = 0 ; j < getColumn(); j++){
				table[i][j] = otherObject.table[i][j];
			}
		}
	return *this;
}
Matrix Matrix::operator *(Matrix& otherObject){
	Matrix result(getRow(),getColumn());
	if(getColumn() != otherObject.getRow()){
		cerr << "error in multilication " << endl;
		exit(1);
	}

	for(int i = 0 ; i < getRow(); i++){
		for(int j = 0 ; j < getRow(); j++){
			result.table[i][j] = 0;
		}
	}
	for(int i = 0 ; i < getRow(); i++){
		for(int j = 0 ; j < otherObject.getRow();j++){
			for(int k = 0 ; k < otherObject.getColumn(); k++){
				result.table[i][k] += table[i][j]*otherObject.table[j][k];
			}
		}
	}
	return result;
}
void Matrix::powerIterationDeflation(string filename,double tolerans){
	Matrix vectorA(getRow(),1);
	Matrix vectorB(getRow(),1);
	Matrix vectorC(getRow(),1);
	Matrix vectorU(getRow(),1);
	Matrix vectorUTranpose(1,getRow());
	Matrix temp(getRow(),getRow());
	Matrix vectorTemp(getRow(),1);
	Matrix B(getRow(),getRow());
	double largeNumber = 0;
	vector<double> oldNumber;
	int cnt = 0;
	int counter=0;
	ofstream myfile;



	for(int i = 0 ; i < getRow(); i++){
		vectorA.table[i][0] = 1;
	}
	vectorB = *this * vectorA;
	for(int i = 0 ; i < getRow(); i++){
		for(int j = 0 ; j < getRow(); j++){
			temp.table[i][j] = table[i][j] ;
		}
	}


	/*for(int i = 0 ; i < getRow(); i++){
		cout << vectorB.table[i][0] << endl;
	}*/

	for(int i = 0 ; i < getRow(); i++){
		if(abs(vectorB.table[i][0]) > abs(largeNumber)){
			largeNumber = vectorB.table[i][0];
		}
	}
	oldNumber.push_back(largeNumber);

	for(int i = 0; i < getRow(); i++){
		vectorB.table[i][0] = vectorB.table[i][0] / largeNumber;
	}

	/*for(int i = 0 ; i < getRow(); i++){
		cout << vectorB.table[i][0] << endl;
	}*/


//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

	while(1){
		largeNumber = 0;
		vectorC = *this * vectorB;

		/*for(int i = 0 ; i < getRow(); i++){
			cout << vectorC.table[i][0] << endl;
		}*/

		for(int i = 0 ; i < getRow(); i++){
			if(abs(vectorC.table[i][0]) > abs(largeNumber)){
				largeNumber = vectorC.table[i][0];
			}
		}

		oldNumber.push_back(largeNumber);

		for(int i = 0; i < getRow(); i++){
			vectorC.table[i][0] = vectorC.table[i][0] / largeNumber;
		}
		if(tolerans > abs(oldNumber[oldNumber.size()-1] - oldNumber[oldNumber.size()-2])){
			cnt++;
			break;
		}

		for(int i = 0 ; i <  getRow() ; i++){
			vectorB.table[i][0] = vectorC.table[i][0];
		}
		/*for(int i = 0 ; i < getRow(); i++){
			cout << vectorC.table[i][0] << endl;
		}*/
	}
		cout << "Eigenvalue " << cnt << " is: " <<  setprecision(2)<< fixed<<oldNumber[oldNumber.size()-1] << endl;
		cout << endl;
		for(int i = 0 ; i < getRow(); i++){
				cout << vectorC.table[i][0] << endl;
				cout << endl;
			}

		myfile.open(filename.c_str());
		if(myfile.is_open()){
			myfile << "Eigenvalue " << cnt << " is: " <<  setprecision(2)<< fixed<<oldNumber[oldNumber.size()-1] << endl;
			myfile << endl;
			for(int i = 0 ; i < getRow(); i++){
				myfile << vectorC.table[i][0] << endl;
				myfile << endl;
			}
			myfile.close();
		}else{
			cerr << "error opening output file !!!1" << endl;
			exit(1);
		}
		for(int i = 0 ; i < getRow(); i++){
					if(vectorB.table[i][0] == 1)
						counter = i;
				}
				for(int i = 0 ; i < getRow(); i++){
					if(i == counter)
						vectorTemp.table[i][0] = 1;
					else
						vectorTemp.table[i][0] = 0;
				}
			for(int i = 0 ; i < getRow();i++){
				cout << "---: " << vectorTemp.table[i][0] << endl;
			}
		vectorU = transpose()*vectorTemp;
		for(int i = 0 ; i < getRow(); i++){
			cout << "Vector[" << i << "][0]->" << vectorU.table[i][0] << endl;
		}
		for(int i = 0 ; i < getRow(); i++){
			vectorUTranpose.table[0][i] = vectorU.table[i][0];
		}
		for(int i = 0 ; i < getRow(); i++){
			cout << "Transpose of Vector[" << i << "][0]->" << vectorUTranpose.table[0][i] << endl;
		}
		B = vectorB*vectorUTranpose;
		for(int i = 0 ; i < getRow(); i++){
			for(int j = 0 ; j < getRow(); j++){
				cout << B.table[i][j] << " ";
			}
			cout << endl;
		}
		cout << endl;

		for(int i = 0 ; i < getRow(); i++){
			for(int j = 0 ; j < getRow(); j++){
				cout << table[i][j] << " ";
			}
			cout << endl;
		}
		*this = temp;
		for(int i = 0 ; i < getRow(); i++){
			for(int j = 0 ; j < getRow(); j++){
				cout << table[i][j] << " ";
			}
			cout << endl;
		}
		*this = temp - B;
		for(int i = 0 ; i < getRow(); i++){
			for(int j = 0 ; j < getRow(); j++){
				cout << table[i][j] << " ";
			}
			cout << endl;
		}
		vectorB = *this * vectorA;
			for(int i = 0 ; i < getRow(); i++){
				for(int j = 0 ; j < getRow(); j++){
					temp.table[i][j] = table[i][j] ;
				}
			}


			/*for(int i = 0 ; i < getRow(); i++){
				cout << vectorB.table[i][0] << endl;
			}*/

			for(int i = 0 ; i < getRow(); i++){
				if(abs(vectorB.table[i][0]) > abs(largeNumber)){
					largeNumber = vectorB.table[i][0];
				}
			}
			oldNumber.push_back(largeNumber);

			for(int i = 0; i < getRow(); i++){
				vectorB.table[i][0] = vectorB.table[i][0] / largeNumber;
			}

			/*for(int i = 0 ; i < getRow(); i++){
				cout << vectorB.table[i][0] << endl;
			}*/


		//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


			while(1){
				largeNumber = 0;
				vectorC = *this * vectorB;

				/*for(int i = 0 ; i < getRow(); i++){
					cout << vectorC.table[i][0] << endl;
				}*/

				for(int i = 0 ; i < getRow(); i++){
					if(abs(vectorC.table[i][0]) > abs(largeNumber)){
						largeNumber = vectorC.table[i][0];
					}
				}

				oldNumber.push_back(largeNumber);

				for(int i = 0; i < getRow(); i++){
					vectorC.table[i][0] = vectorC.table[i][0] / largeNumber;
				}
				if(tolerans > abs(oldNumber[oldNumber.size()-1] - oldNumber[oldNumber.size()-2])){
					cnt++;
					break;
				}

				for(int i = 0 ; i <  getRow() ; i++){
					vectorB.table[i][0] = vectorC.table[i][0];
				}
				/*for(int i = 0 ; i < getRow(); i++){
					cout << vectorC.table[i][0] << endl;
				}*/
			}
				cout << "Eigenvalue " << cnt << " is: " <<  setprecision(2)<< fixed<<oldNumber[oldNumber.size()-1] << endl;
				cout << endl;
				
				for(int i = 0 ; i < getRow(); i++){
				cout << vectorC.table[i][0] << endl;
				cout << endl;
			}

		myfile.open(filename.c_str());
		if(myfile.is_open()){
			myfile << "Eigenvalue " << cnt << " is: " <<  setprecision(2)<< fixed<<oldNumber[oldNumber.size()-1] << endl;
			myfile << endl;
			for(int i = 0 ; i < getRow(); i++){
				myfile << vectorC.table[i][0] << endl;
				myfile << endl;
			}
			myfile.close();
		}else{
			cerr << "error opening output file !!!1" << endl;
			exit(1);
		}

}
/*
void Matrix::findSecondEigenValue(string filename, double tolerans){
	Matrix vectorA(getRow(),1);
	Matrix vectorB(getRow(),1);
	Matrix vectorC(getRow(),1);
	Matrix vectorU(getRow(),1);
	Matrix vectorUTranpose(1,getRow());
	Matrix temp(getRow(),getRow());
	Matrix vectorTemp(getRow(),1);
	Matrix B(getRow(),getRow());
	double largeNumber = 0;
	vector<double> oldNumber;
	int counter = 0,j;
	ofstream myfile;


	for(int i = 0 ; i < getRow(); i++){
		vectorA.table[i][0] = 1;
	}
	vectorB = *this * vectorA;
	for(int i = 0 ; i < getRow(); i++){
		for(int j = 0 ; j < getRow(); j++){
			temp.table[i][j] = table[i][j] ;
		}
	}


	for(int i = 0 ; i < getRow(); i++){
		cout << vectorB.table[i][0] << endl;
	}

	for(int i = 0 ; i < getRow(); i++){
		if(abs(vectorB.table[i][0]) > abs(largeNumber)){
			largeNumber = vectorB.table[i][0];
		}
	}
	oldNumber.push_back(largeNumber);

	for(int i = 0; i < getRow(); i++){
		vectorB.table[i][0] = vectorB.table[i][0] / largeNumber;
	}

	for(int i = 0 ; i < getRow(); i++){
		cout << vectorB.table[i][0] << endl;
	}





	while(1){
		largeNumber = 0;
		vectorC = *this * vectorB;

		for(int i = 0 ; i < getRow(); i++){
			cout << vectorC.table[i][0] << endl;
		}

		for(int i = 0 ; i < getRow(); i++){
			if(abs(vectorC.table[i][0]) > abs(largeNumber)){
				largeNumber = vectorC.table[i][0];
			}
		}

		oldNumber.push_back(largeNumber);

		for(int i = 0; i < getRow(); i++){
			vectorC.table[i][0] = vectorC.table[i][0] / largeNumber;
		}
		if(tolerans > abs(oldNumber[oldNumber.size()-1] - oldNumber[oldNumber.size()-2])){
			counter++;
			break;
		}

		for(int i = 0 ; i <  getRow() ; i++){
			vectorB.table[i][0] = vectorC.table[i][0];
		}
		for(int i = 0 ; i < getRow(); i++){
			cout << vectorC.table[i][0] << endl;
		}
	}
		cout << "Eigenvalue " << counter << " is: " <<  setprecision(2)<< fixed<<oldNumber[oldNumber.size()-1] << endl;
		cout << endl;

}*/
Matrix Matrix::transpose(){
	double** matrix;
	matrix = new double*[getRow()];
	for (int i = 0; i < row; i++){
		matrix[i] = new double[getColumn()];
	}
	for(int i = 0 ; i < getRow(); i++){
		for(int j = 0 ; j < getColumn(); j++){
			matrix[i][j] = table[j][i];
		}
	}
	for(int i = 0 ; i < getRow(); i++){
		for(int j = 0 ; j < getColumn(); j++){
			table[i][j] = matrix[i][j];
		}
	}

	for(int i = 0 ; i < getRow(); i++){
		delete matrix[i];
	}
	delete matrix;

	return *this;
}

int main(int argc, char const *argv[]){
	Matrix alp("A.txt");


	alp.powerIterationDeflation("X.txt",1e-6);

	return 0;
}

