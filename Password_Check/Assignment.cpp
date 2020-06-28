#include <iostream>

using namespace std;

bool checkpass(const char*);

int main() {
	const char* passes[] =
	{
	"AbcDe93", "A1b:A1b>", "Ab:Acb<",
	"abc123><", "Zorro@123", nullptr
	};

	for (int i = 0; passes[i] != nullptr; ++i) {
		cout << "checking " << passes[i] << endl;
		if (checkpass(passes[i])) cout << "OK" << endl;
		cout << endl;
	}

	return 0;
}

bool checkpass(const char* pass) {
	size_t atLeastEightCharacters{ 0 };
	size_t atLeastSixDifferentCharacters{ 0 };  
	bool atLeastOneDigit{ false };
	bool atLeastOneUpperCaseLetter{ false };
	bool atLeastOneNonAlphaNumericCharacter{ false };

	for (size_t i{ 0 }; i < pass[i] != '\0'; i++) {
		bool appears{ false };
		
		if (pass[i] >= 65 && pass[i] <= 90) {
			atLeastOneUpperCaseLetter = true;
		}

		if (pass[i] >= 48 && pass[i] <= 57) {
			atLeastOneDigit = true;
		}

		if ((pass[i] >= 32 && pass[i] <= 47) || (pass[i] >= 58 && pass[i] <= 64) || (pass[i] >= 123 && pass[i] <= 126)) {
			atLeastOneNonAlphaNumericCharacter = true;
		}

		atLeastEightCharacters++;

		for (size_t j{ 0 }; j < i; j++) {
			if (pass[j] == pass[i]) {
				appears = true;
				break;
			}
		}

		if (!appears) atLeastSixDifferentCharacters++;
	}

	if (!atLeastOneDigit) cout << "No digit" << "\n";
	if (!atLeastOneNonAlphaNumericCharacter) cout << "No non-alphanumeric character" << "\n";
	if (!atLeastOneUpperCaseLetter) cout << "No uppercase letter" << "\n";
	if (atLeastSixDifferentCharacters < 6) cout << "Too few different characters" << "\n";
	if (atLeastEightCharacters < 8) cout << "Too short" << "\n";

	
	if (atLeastOneUpperCaseLetter && atLeastOneDigit && atLeastOneNonAlphaNumericCharacter && (atLeastSixDifferentCharacters >= 6) && (atLeastEightCharacters>= 8)) {
		return true;
	}
}