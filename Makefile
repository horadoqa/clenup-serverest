.PHONY: buscar_ids deletar_ids

# ===================================================== #
# 1) Buscar IDs de usuários e salvar no arquivo ids.txt #
# ===================================================== #
buscar_ids:
	@echo "Buscando IDs de usuários"
	@ids=$$(curl -s "https://serverest.dev/usuarios" \
		| jq -r '.usuarios[] ._id'); \
	if [ -z "$$ids" ]; then \
		echo "Nenhum usuário encontrado!"; \
	else \
		echo "$$ids" > ids.txt; \
		echo "IDs encontrados foram salvos em ids.txt"; \
	fi

# ================================ #
# 2) Deletar usuários via ids.txt  #
# ================================ #
deletar_ids: buscar_ids
	@BASE_URL="https://serverest.dev/usuarios"; \
	if [ ! -f ids.txt ]; then \
		echo "Arquivo ids.txt não encontrado!"; \
		exit 1; \
	fi; \
	while read -r ID; do \
		if [ -n "$$ID" ]; then \
			echo "Deletando usuário com ID: $$ID"; \
			curl -s -X DELETE "$$BASE_URL/$$ID"; \
			printf "\n---------------------------------------\n"; \
		fi; \
	done < ids.txt