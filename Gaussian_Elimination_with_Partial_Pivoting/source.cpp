#include<iostream>
#include<fstream>
#include<cmath>
using namespace std;

int main(){
	
	string line;
	int rA=0; // Row number of given matrix A.
	int rB=0; // Row number of given vector B.
	
	ifstream vectorBf("B.txt"); // get input from file B.txt
	if(vectorBf.is_open()) // if file opened succesfully
	{
		while(!vectorBf.eof()){ // while end of the file
			getline(vectorBf,line); 
			rB++;					// get row number of given vector B.
		}
		vectorBf.seekg(0,ios::beg);	// need to get beginning of the file. Because we need this file later.
	}
	else{	// if file not opened succesfully
		cout << "Unable to open this file!" << endl;  
	}
	double * vectorB = new double  [rB];  // Set dynamic memory of vector B.
	
	cout << "Vector B is:" << endl;		
	for(int i=0; i<rB; i++)
	{
		vectorBf >> vectorB[i];				// set the values in file to the VectorB.
		cout << vectorB[i] << endl << endl;	// Print Vector B.
	}
	vectorBf.close();		//CLose file 
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
					
ifstream matrixAf("A.txt"); // get file as an input : A.txt
	if(matrixAf.is_open())	// if file opened succesfully
	{
		while(!matrixAf.eof()){		// while end of the file read 
			getline(matrixAf,line); 
			rA++;						// set row number of MatrixA.
		}
		matrixAf.seekg(0,ios::beg);		//  need to get beginning of the file. Because we need this file later.
	}
	else
	{
		cout << "Unable to open this file!" << endl;
	}
	
	double ** matrixA = new double * [rA];		// dynamic memory of A matrix
	
	for(int a=0; a<rA; a++)
	{	
		matrixA [a] = new double [rA];	// set row of matrixA. Gives another dimetion.
	}
	cout << "Matrix A is:" << endl;
	for(int i=0; i<rA; i++){
		for(int j=0; j<rA; j++)
		{
			matrixAf >> matrixA[i][j];		// set values in file to the Matrix A.
			cout << " " << matrixA[i][j];	// print Matrix A.
		}
		cout << endl; 
	}
	cout << endl;
	matrixAf.close(); //close file.
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if(rA==2)
	{	
		double detA = (matrixA[0][0]*matrixA[1][1]) - (matrixA[0][1]*matrixA[1][0]); // determinant of 2*2 matrix.
		double condOne = (abs(matrixA[0][0])+abs(matrixA[1][0])) > (abs(matrixA[0][1]) + abs(matrixA[1][1])) ? (abs(matrixA[0][0]) + abs(matrixA[1][0])):(abs(matrixA[0][1])+abs(matrixA[1][1]));		//condition nubmer of 2*2 matrix for the 1st norm.
		double condIn = (abs(matrixA[0][0]) +abs(matrixA[0][1]) ) > (abs(matrixA[1][0]) +abs(matrixA[1][1]) ) ? (abs(matrixA[0][0]) +abs(matrixA[0][1]) ) : (abs(matrixA[1][0]) +abs(matrixA[1][1]));	//condition nubmer of 2*2 matrix for the infinity norm.
		double condInv1 = (abs(matrixA[1][1]/detA)+abs(matrixA[1][0]/detA)) > (abs(matrixA[0][1]/detA)+abs(matrixA[0][0]/detA))? (abs(matrixA[1][1]/detA)+abs(matrixA[1][0]/detA)):(abs(matrixA[0][1]/detA)+abs(matrixA[0][0]/detA));	//sub condition nubmer of 2*2 inverse matrix for the 1st norm.
		double condInvInf = (abs(matrixA[1][1]/detA)+abs(matrixA[0][1]/detA)) > (abs(matrixA[1][0]/detA)+abs(matrixA[0][0]/detA))? (abs(matrixA[1][1]/detA)+abs(matrixA[0][1]/detA)):(abs(matrixA[1][0]/detA)+abs(matrixA[0][0]/detA)); //sub condition nubmer of 2*2 inverse matrix for the ifinity norm.
		double cond1 = condOne  * condInv1; //condition nubmer of 2*2 matrix for the 1st norm.
		double condInf = condIn * condInvInf; //condition nubmer of 2*2 matrix for the infinity norm.
		cout << "Condition Number at matrix Norm(1) : " <<  cond1 <<endl << "Condition Number at matrix Norm(Infinity) : " << condInf << endl<< endl;
	}
	
	int sing = 0; // set a singularity variable to detect singularity.
	for(int a=0; a<rA ; a++)
	{
		double subPivot = matrixA[a][a]; //set pivot variable to detect maximum pivot from candidates.
		int rowNum = a;	// number of the row that detected maximum pivot.
		
		for(int b=a+1;b<rA;b++){	//to detect maximum pivot and its row number.
			
			if(abs(subPivot)<matrixA[b][a]) //compare first component of the column to find maximum pivot
			
			{
				subPivot = matrixA[b][a];
				rowNum = b;
			}
		}
		if(abs(subPivot) >= 1E-7) // set machine precision as 1e^-7
		{	
			for(int c=0; c<rA; c++)
			{
				double temp = matrixA[rowNum][c]; // row exchange operation for matrix A.
				matrixA[rowNum][c]=matrixA[a][c];
				matrixA[a][c]=temp;
			}
				double temp1 = vectorB[a];		//row exchange operation for vector B.
				vectorB[a]=vectorB[rowNum];
				vectorB[rowNum]=temp1;			
		
			double pivotRatio; //to build upper triangular we need this ratio of pivot and other component of column.
			for(int d=a+1;d<rA;d++)
			{
				pivotRatio= matrixA[d][a]/matrixA[a][a];
				for(int e=0;e<rA;e++){
					matrixA[d][e]=matrixA[d][e]-pivotRatio*matrixA[a][e];	//make 0 under pivot's components
				}
					vectorB[d]=vectorB[d]-pivotRatio*vectorB[a]; // use same operation to vector B.
			}
		}
		else if(sing==0) // detect that matrix A is sungular.
		{	
			cout << "This matrix is a singular matrix!" << endl;
			sing=1;		//set value of singular variable to not make other operations below to find solution. if singularity detect program quit!
		}		
	}
	if(sing==0){
		ofstream vectorXf("X.txt");		// set file as an output : X.txt 
		double * vectorX = new double [rB];	//dynamic memory for vector X
		if(vectorXf.is_open())		//if this file created succesfully
		{
			vectorX[rA-1]= vectorB[rB-1]/matrixA[rA-1][rA-1]; // set value of last component directly to end component of matrix A after gauss elimination.
			
			for(int f=rA-2;f>=0;f--) // calculate vector X with back-substitution
			{
				double s=0;
				for(int g=rA-1;g>f;g--)
				{
					s = s + vectorX[g]*matrixA[f][g];	
				}
				vectorX[f] = (vectorB[f]-s)/matrixA[f][f];
			}
		}	
		else // if file can not created.
		{
			cout << "Unable to write this file!" << endl;	
		} 
		cout << "The solution Vector 'X' is:" << endl;
		for(int h =0;h<rA;h++)
		{
			vectorXf << vectorX[h] << endl;		//set values in the vector X to created X file.
			cout << "X" << h << " : " <<  vectorX[h] << endl;		//print vector X.
		}
	}	
}
	
	
	
	

