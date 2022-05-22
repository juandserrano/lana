.PHONY: fullbuild
fullbuild:
	make -C ../web dockerimage
	make -C ../api dockerimage
	docker-compose up
