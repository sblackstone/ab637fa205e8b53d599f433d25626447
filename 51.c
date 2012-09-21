#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <math.h>
#define MAX_PRIME 400000000
#define NHASH 7919
//#define NHASH 29989
#define MULT 1013
//#define MAX_PRIME 60000

struct node 
{
  char *word;
  int count;
  struct node * next;
} node;

typedef struct node Node;

Node *bin[NHASH];

unsigned int hash(char *p) {
  unsigned int h = 0;
  for (; *p; p++)
    h = MULT * h + *p;
  return h % NHASH;
}

void incword(char *s)
{
  Node * p;
  int h = hash(s);
  for(p = bin[h]; p!= NULL; p = p->next) {
    if(strcmp(s, p->word) == 0) {
      (p->count)++;
      if (p->count > 6) { 
        printf("%d:%s\n",p->count,s);
        //exit(0);
      }

      return;
    }
  }
  p = (Node *)malloc(sizeof(node));
  if(!p)
    return;
  p->count = 1;
  p->word = (char *)malloc(strlen(s)+1);
  strcpy(p->word, s);
  p->next = bin[h];
  bin[h] = p;
}

void keys(int i) {
  char s[25];
  char tmp;
  int j,k;  
  sprintf(s, "%d", i);
  for (j =0; j < (strlen(s) - 1); j++) { 
    for (k = j+1; k < (strlen(s) - 1); k++) {
      if (s[j] == s[k]) {
        tmp = s[k];
        s[j] = '*';
        s[k] = '*';
        incword(s);
        s[j] = tmp;
        s[k] = tmp;
      }
    }
  }

}

int main(int argc, char *argv) {
  int i,k;
  double fin = sqrt(MAX_PRIME) + 1;
  int *primes;
  for (i=0; i<NHASH; i++)
    bin[i] = NULL;
  primes = (int *)malloc(sizeof(int) * MAX_PRIME);
  bzero(primes, MAX_PRIME*sizeof(int));
  primes[0] = -1;
  primes[1] = -1;
  printf("Memory initialized\n");
  for (i = 3; i < fin; i += 2) {
    if (primes[i] == -1)
      continue;
    k = 2 * i;
    while(k < MAX_PRIME + 1) {
      primes[k] = -1;
      k = k + i;
    }
  }
  printf("We have the primes\n");
  for (i=3; i < MAX_PRIME; i+=2) {
    if (primes[i] > -1) {
      //printf("Found prime %d\n",i);
      keys(i);
    }
  }
}
