//
//  ContentView.swift
//  calculator
//
//  Created by Jhonatan on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var values = "0"
    @State var previous = 0.0
    @State var result = 0.0 //Variavel que muda seu estado conforme forem acontecendo as operações
    @State var decimal = 0.0
    
    
    @State var operation = 0 //Criando o operador (O número será responsável por uma operação)
    @State var previousOperation = 0
    
    
    //Função para retirar casas decimais quando não forem necessárias
    func removeZerosFromEnd(value: Double) -> String {
        let f = NumberFormatter()
        let number = NSNumber(value: value)
        f.minimumFractionDigits = 0
        f.maximumFractionDigits = 16
        return f.string(from: number) ?? ""
    }
    
    //Criando a função de calculo
    func process(digit: Int) {
        if operation > 0 {
            result = 0
            previousOperation = operation
            operation = -1
        }
        if decimal > 0.0 {
            result = result + Double(truncating: NSNumber(value: (Double(digit) / decimal)))
            decimal = decimal * 10
            values = "\(values)\(digit)"
        } else {
            result = (result * 10) + Double(digit)
            values = removeZerosFromEnd(value: result)
        }
    }
    func reset() {
        previous = 0
        result = 0
        previousOperation = 0
        operation = 0
        decimal = 0
        values = "0"
    }
    //Função de operações, de acordo com o número (operation = 4) escolhido
    func calculate() {
        if previousOperation == 1 {//soma
            result = previous + result
            previousOperation = 0
        } else if previousOperation  == 2 { //subtração
            result = previous - result
            previousOperation = 0
        } else if previousOperation  == 3 { //multiplicação
            result = previous * result
            previousOperation = 0
        } else if previousOperation  == 4 { //divisão
            result = previous / result
            previousOperation = 0
        }
        decimal = 0.0
        previous = result
        values = removeZerosFromEnd(value: result)
    }
    var body: some View {
        VStack (alignment: .trailing, spacing: 0) /*Para retirar o espaçamento entre as linhas (componentes)*/ {
            Spacer()
            HStack {
                Text(values)
                    .padding()
                    .lineLimit(1)
                    .font(.system(size: CGFloat(80 / Int((Double(String(result).count + 10) / 8.0)))))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
            }
            HStack(spacing: 0) {
                Button("AC") {
                    //Resetando a calculadora sempre que apertar no botão "AC" por meio de uma função
                    reset()
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("+/-") {
                    result = result * -1
                    calculate()
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("%") {
                    result = result / 100
                    calculate()
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("/") {
                    calculate()
                    operation = 4
                }.padding(.vertical, 40)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.orange)
                
            }.foregroundColor(Color.white)
            HStack(spacing: 0) {
                Button("7") {
                    //Usando uma função para fazer os calculos
                    process(digit: 7)
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("8") {
                    //Usando uma função para fazer os calculos
                    process(digit: 8)
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("9") {
                    //Usando uma função para fazer os calculos
                    process(digit: 9)
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("x") {
                    calculate()
                    operation = 3
                }.padding(.vertical, 40)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.orange)
                
            }.foregroundColor(Color.white)
            HStack(spacing: 0) {
                Button("4") {
                    //Usando uma função para fazer os calculos
                    process(digit: 4)
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("5") {
                    //Usando uma função para fazer os calculos
                    process(digit: 5)
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("6") {
                    //Usando uma função para fazer os calculos
                    process(digit: 6)
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("-") {
                    calculate()
                    operation = 2
                }.padding(.vertical, 40)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.orange)
                
            }.foregroundColor(Color.white)
            HStack(spacing: 0) {
                Button("1") {
                    //Usando uma função para fazer os calculos
                    process(digit: 1)
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("2") {
                    //Usando uma função para fazer os calculos
                    process(digit: 2)
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("3") {
                    //Usando uma função para fazer os calculos
                    process(digit: 3)
                }.padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("+") {
                    calculate()
                    operation = 1
                }.padding(.vertical, 40)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.orange)
                
            }.foregroundColor(Color.white)
            //Para dividir o tamanho da tela em apenas 3 espaços
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Button("0") {
                        //Usando uma função para fazer os calculos
                        process(digit: 0)
                    }.padding()
                        .frame(minWidth:  geometry.size.width / 2) //define que a largura será da largura total dividido por 2.
                    Button(".") {
                        if decimal == 0.0 {
                            decimal = 10.0
                            // Lógica para inserir o ponto (número decimal)
                            values = values + "."
                        }
                         
                    }.padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    Button("=") {
                        calculate()
                        previous = 999
                        operation = 999
                    }.padding(.vertical, 40)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.orange)
                    
                }.foregroundColor(Color.white)
            }.frame(maxHeight: 92)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color.gray)
    }
}
#Preview {
    ContentView()
}
