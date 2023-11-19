#include "types.h"
#include "stat.h"
#include "user.h"

int 
main(int argc, char * argv[])
{
  if (argc < 2){
    printf(0, "Not enough arguments. Try hist <print/1-10>\n");
    exit();
  }

  if (!strcmp(argv[1], "print")){
    hist();
  }
  else {
    int cmdNum = atoi(argv[1]);
    runhist(cmdNum);
  }
  
  exit(); // return 0;
}
