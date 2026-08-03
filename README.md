# clenup-serverest

Rotina para limpar os resultados dos testes automatizados no serverest realizados pelo Hora do QA


## Fluxo

```Mermaid
flowchart TD
    A[GitHub Actions] --> B["make deletar_ids"]

    B --> C[buscar_ids]
    C --> D["Gera ids.txt"]

    B --> E[deletar_ids]
    D --> E

    E --> F["Remove todos os usuários encontrados"]
```

