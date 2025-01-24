package main

import (
	"fmt"
)

func main() {
	var variavel int
	fmt.Println("Você deseja inserir novos dados ou manter os dados do exemplo:")
	fmt.Println("1- Manter Dados")
	fmt.Println("2- Entrar com novos dados")
	fmt.Print("Escolha: ")
	fmt.Scan(&variavel)

	var p, l, area, R_ca50, T float64

	if variavel == 1 {
		p = 17   // Resistividade
		l = 1000 // Comprimento
		area = 1113 * 1e3 // Área Cmil
		R_ca50 = 0.0956   // Resistência em Corrente Alternada 50
		T = 228
	}

	if variavel == 2 {
		var cond int
		fmt.Println("Qual tipo de condutor? :")
		fmt.Println("1- Cobre")
		fmt.Println("2- Aluminio")
		fmt.Print("Escolha: ")
		fmt.Scan(&cond)

		if cond == 1 {
			p = 10.66
			T = 234.5 // Cobre recozido com 100% de condutividade
		} else if cond == 2 {
			p = 17
			T = 228 // Alumínio com 61% de condutividade
		}

		l = 1000
		fmt.Print("Insira a área do condutor em cmil: ")
		fmt.Scan(&area)
		fmt.Print("Insira a resistência CA a 50ºC por milha: ")
		fmt.Scan(&R_ca50)
	}

	R_zero := ((p * l) / area) * 1.02
	fmt.Printf("Para 20ºC CC a resistência é: %.2f ohms por 1000 pés\n", R_zero)

	R_cc50 := R_zero * ((T + 50) / (T + 20))
	fmt.Printf("Para 50ºC CC a resistência é %.2f Ohms por 1000 pés\n", R_cc50)

	disprel := R_ca50 / (R_cc50 * 5.280)
	fmt.Printf("A relação entre a resistência CA e CC é %.2f\n", disprel)
}
