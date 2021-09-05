#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>

#include <opencv2\highgui\highgui.hpp>
#include <opencv2\opencv.hpp>
#include <opencv2\imgproc\imgproc.hpp>
//-#include "libxl.h" 
#include <iostream>
#include <fstream>
#include <sstream>

using namespace cv;
//using namespace libxl;
using namespace std;

const int ROW = 202;
const int COL = 2048;
const int BUFFSIZE = 100000;

int main()
{
	unsigned char pixel[ROW][COL];
	unsigned char tempLine[1][COL];
	for (int i = 0; i < 202; i++)
	{
		for (int j = 0; j < 2048; j++)
		{
			pixel[i][j] = 0;
		}
	}

	int index_row = 0;
	int index_col = 0;
	bool isFirstTime = true;
	namedWindow("Display Image", CV_WINDOW_AUTOSIZE);
	//resizeWindow("Display Image", 2048, 200);

	char buff[BUFFSIZE]; // a buffer to temporarily park the data
	ifstream infile;
	stringstream ss;
	infile.open("lan1.txt", ios::in);
	int countLine = 0;
	if (infile.is_open())
	{
		while (!infile.eof()) //keep reading until end-of-line
		{
			infile.getline(buff, BUFFSIZE); //get line-by-line
			cout << countLine << endl;
			countLine++;
			//copy the entire line into the stringstream
			ss << buff;
			while (ss.getline(buff, 6, ','))//get elements into each line
			{
				pixel[index_row][index_col++] = stoi(buff);
			}
			// saving for new line
			index_col = 0;
			index_row++;
			// This copies an empty string into ss, erasing the previous contents.
			//		ss << "";
			// This clears the 'eof' flag.  Otherwise, even after writing new data to ss we wouldn't be able to read from it.
			ss.clear();
			if (true == isFirstTime)
			{
				if (200 == index_row)
				{
					isFirstTime = false;
					Mat image(200, 2048, CV_8UC1, pixel); //CV_<bit-depth>{U|S|F}C(<numberofchannels>), 8 bit single-channel array
					/*Size size(2048, 200);
					resize(image, image, size);*/
					imshow("Display Image", image);
					waitKey(1);
				}
			}
			if ((false == isFirstTime) && (index_row > 200))
			{
				index_row = index_row - 1;
				for (int k = 1; k <= 200; k++)
				{
					for (int h = 0; h < 2048; h++)
					{
						pixel[k - 1][h] = pixel[k][h];
					}
				}
				Mat image(200, 2048, CV_8UC1, pixel); //CV_<bit-depth>{U|S|F}C(<numberofchannels>), 8 bit single-channel array
				Mat newImg = Mat::zeros(200,1024,CV_64F);
				resize(image, newImg, newImg.size());
				imshow("Display Image", newImg);
				waitKey(1);
			}
		}
		//end of while loop
	}
	//end of if loop
	infile.close();
	getchar();
	return 0;
}
