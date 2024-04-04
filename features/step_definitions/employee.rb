Dado('que o usuario altere informacao de funcionario') do
    @put_url = 'https://reqres.in/api/users/7'
  end
  
  Quando('ele enviar as novas informacoes') do
    @update_employee = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: {
        "id": 1,
        "email": "emma.johnson@reqres.in",
        "first_name": "Emma",
        "last_name": "Johnson",
        "avatar": "https://reqres.in/img/faces/1-image.jpg"
  }.to_json)
    puts @update_employee
  end
  
  Entao('as informacoes serao alteradas') do
    expect(@update_employee.code).to eq(200)
    expect(@update_employee.message).to eq('OK')
    expect(@update_employee['first_name']).to eq('Emma')
    puts "Alteração feita com sucesso no cadastro da funcionária #{@update_employee['first_name']}!"
end