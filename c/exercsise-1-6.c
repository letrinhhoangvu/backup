
#include<stdio.h>
/*Output the value of  the expression getchar() !=EOF*/
main()
{
      int c;
      printf("Press the ENTER  key:");
      c=getchar();
     
      printf("The value of the Expression getchar() !=EOF is:%d\n",getchar()!=EOF);
      return 0;
}