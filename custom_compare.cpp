#include <mysql.h>
#include <string.h>
#ifndef my_bool
#define my_bool bool
#endif

//CREATE FUNCTION custom_compare RETURNS INT SONAME 'libcustome_compare.so';
extern "C" long long custom_compare(UDF_INIT *initid, UDF_ARGS *args,
                                    char *is_null, char *error)
{
    long long arg1 = *((long long *)args->args[0]);
    long long arg2 = *((long long *)args->args[1]);
    if(arg1>arg2){
        return 1;
    }else if(arg1==arg2){
        return 0;
    }
    return -1;
}
extern "C" my_bool custom_compare_init(UDF_INIT *initid, UDF_ARGS *args,
                                   char *message)
{
    if (args->arg_count != 2)
    {
        strcpy(message, "Wrong arguments to compare;  need 2 values");
        return 1;
    }
    initid->max_length = 21;
    initid->maybe_null = 0;
    return 0;
}
