extern void my_strcpy(const char *src, char *dst);
extern void my_capitalize(char *str);
 
static const char a[] = "Hola Mundo!";
static char b[16];
 
int main(void){
	my_strcpy(a, b);
	my_capitalize(b);
	for(;;){
 
	}
}
