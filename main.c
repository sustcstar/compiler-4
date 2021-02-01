#include "tac.h"
#include "mips32.h"

#define BUF_SIZE 0x10000

char buf[BUF_SIZE];

int main(int argc, char *argv[]){
    FILE *fp;
    tac *head;
    char c, *file;
    int size, len;

    if(argc != 2){
        fprintf(stderr, "Usage:\n");
        fprintf(stderr, "  %s <IR-file>\n", argv[0]);
        return 1;
    }
    file = argv[1]; // .ir 文件

    // read the IR code
    size = 0;
    fp = fopen(file, "r");
    while ((c = getc(fp)) != EOF)
        buf[size++] = c;
    buf[size] = '\x7f';
    fclose(fp);

    // write the target code
    len = strlen(file);
    file[len-2] = 's'; // 这是为啥？
    file[len-1] = '\0'; // 末尾是\0
    fp = stdout; // fopen(file, "w");
    register_num = 0;
    var_offset = 0;
    param_count = 0;
    arg_count = 0;
    head = tac_from_buffer(buf);
    // printf("TAC completed\n");
    mips32_gen(head, fp);
    // fclose(fp);

    return 0;
}
