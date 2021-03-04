#include<stdio.h>
#include<stdlib.h>
#include<errno.h>
#include<inttypes.h>

typedef int32_t (*callback)(int32_t);
typedef int32_t (*err)(int32_t);

extern void _lab(int32_t x, int32_t y, callback cb,err error);

int32_t process_results1(int32_t x)
{
    printf(" -%d - the result of the calculation !\n", x);
    return 0;
}

int32_t process_results2(int32_t x)
{
    printf(" 1/%d - the result of the calculation !\n", x);
    return 0;
}

int32_t process_results3(int32_t x)
{
    printf(" %d - the result of the calculation !\n", x);
    return 0;
}

int32_t error()
{
    printf("[ERROR]OVERFLOW(РЕГИСТРЫ ВСЕ ТАКИ НЕ РЕЗИНОВЫЕ)\n");
    return 1;
}

int32_t negative_signs(int32_t a, int32_t k)
{
    if(a < 0)
    {
        if(k % 2 != 0)
        {
            return 1;
        }
    }
    else if(k < 0)
    {
        return 2;
    }
    else
    {
        return 0;
    }
    
    
}


int main()
{
    printf("Программа подсчета числа в степени\n");
    int32_t a;
    int32_t k;
    printf("Введите число\n");
    scanf("%d",&a);
    printf("Введите степень\n");
    scanf("%d",&k);

    if(negative_signs(a,k)==1)
    {
        a=abs(a);
        _lab(a,k,process_results1, error);
    }
    else if(negative_signs(a,k)==2)
    {
        k=abs(k);
        _lab(a,k,process_results2, error);
    }
    else
    {
        a=abs(a);
        _lab(a,k,process_results3, error);
    }
    
    
    return 0;
}