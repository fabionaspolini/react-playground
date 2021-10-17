# O script gera o pacote npm, renomeia e instala para resolver problemas de cache do yarn. Mesmo limpando o cache o yarn não pegava o pacote atualizado.
script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
original_path=$(pwd)
now=$(date +"%Y%m%d.%H%M%S")
pkg_name=my-lib-$now.tgz

# echo Removendo versão antiga
# yarn remove my-lib

echo Gerando pacote $pkg_name
cd $script_dir/../my-lib
npm pack
mv my-lib-*.tgz $pkg_name

echo Instalando nova versão
cd $script_dir
yarn add file:../my-lib/$pkg_name

rm -f $script_dir/../my-lib/$pkg_name

cd $original_path