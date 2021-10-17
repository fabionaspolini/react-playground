Executar script `update-lib.sh` para gerar pacote atualizado da `my-lib` e aplicar no projeto `my-app-ts`.

Este script é necessário para resolver problemas de cache do yarn, mesmo executando `yarn cache clean my-lib --all` de alguma forma era mantido o cache pelo nome do pacote `my-lib-1.0.0.tgz`.

Para resolver o problema, após a geração do pacote com o `npm pack` é renomeado com o padrão da data de compliação e então instalado.



Comandos testados:

```bash
yarn add file:../my-lib/my-lib-1.0.0.tgz
yarn remove my-lib
yarn cache clean my-lib --all
yarn cache clean my-lib --mirror
yarn cache list --pattern my-lib
```
