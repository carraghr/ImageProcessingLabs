#include <GL/gl.h>
#include <GL/glext.h>
#include <GL/glut.h>
#include<stdio.h>
/* 
This program illustrates the Mouse Motion Callbacks.
MyMouse illustrates the Passive Motion Callback.
It causes the square to change colour whenever the mouse
enters the square.
MyMouse2 illustrates the Active Motion Callback.
It causes a black point to appear whenever you press
a mouse button.

Please note, this program assumes the window size is 500x500.
If you resize the window it will not work properly
*/

GLfloat hh, ww;

void display(void)
{
	glClearColor(0.0,0.0,1.0,1.0);
	glClear(GL_COLOR_BUFFER_BIT);
	glPointSize(3.0);
	glColor3f(1.0,0.0,0.0);

	glBegin(GL_POLYGON);
		glVertex2f(-0.5,-0.5);
		glVertex2f(-0.5,0.5);
		glVertex2f(0.5,0.5);
		glVertex2f(0.5,-0.5);
	glEnd();

	glFlush();
	return;
}

void MyMouse(GLint x, GLint y)
{
	if (x > (ww/4) && x < ((ww/4)*3) && y > (hh/4) && y < ((hh/4)*3))
		glColor3f(0.0,1.0,0.0);
	else
		glColor3f(1.0,0.0,0.0);

	glBegin(GL_POLYGON);
		glVertex2f(-0.5,-0.5);
		glVertex2f(-0.5,0.5);
		glVertex2f(0.5,0.5);
		glVertex2f(0.5,-0.5);
	glEnd();

	glFlush();	


	return;
}


void MyMouse2(GLint x, GLint y)
{
	printf("X %f Y %f \n", ww, hh);
	glColor3f(0.0,0.0,0.0);
	glPointSize(3.0);
	glBegin(GL_POINTS);
		glVertex2f((x - (ww/2)) /(ww/2),-(y-(hh/2))/(hh/2));
	glEnd();

	glFlush();	

	return;
}

void MyReshape(GLsizei w, GLsizei h){
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	//gluOrtho2D(0.0,(GLfloat)w,0.0,(GLfloat)h);
	glViewport(0,0,w,h);
	hh=h;
	ww=w;
	return;
}
	
int main(int argc, char **argv)
{
	glutInit(&argc, argv);
	glutInitWindowSize(500,500);
	glutInitWindowPosition(500,200);
	glutCreateWindow("mouse");
	glutDisplayFunc(display);
	glutPassiveMotionFunc(MyMouse);
	glutMotionFunc(MyMouse2);

	glutReshapeFunc(MyReshape);

	glutMainLoop();
}
