#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/opencv.hpp>
#include "../../../cvminecraft/opencv_vis/point_set/PointCloudVisualizer.hpp"

using namespace std;
using namespace cv;


int main(int argc, char** argv)
{

    Mat image;
    if(argc==1)
    {
        image = imread("../../../../cvminecraft/data/image/img2.jpg");
    }
    else
    {
        image = imread(argv[1]);
    }

    resize(image,image,Size(0,0),0.5,0.5);

    imshow("img",image);
    waitKey(0);

    //extract depth and display as point cloud;
    int rows = image.rows;
    int cols = image.cols;

    cout<<"rows = "<<rows<<endl;
    cout<<"cols = "<<cols<<endl;

    PointCloudVisualizer pcv;
    for(int i = 0 ; i< rows ; i++)
    {
        for(int j = 0;  j<cols ; j++)
        {
            Vec3b c = image.at<Vec3b>(i,j);
            pcv.addColorPoint(j,i,(c.val[0]+c.val[1]+c.val[2]),c.val[0],c.val[1],c.val[2]);
        }
    }

    pcv.commitPoints();

    pcv.show();


    return 0;
}
