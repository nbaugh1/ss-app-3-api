# frozen_string_literal: true

class SmartsheetClient
  def initialize
    @client = Smartsheet::Client.new(token: ENV['SS_TOKEN'])
  end

  def list_sheets
    response = @client.sheets.list
    @sheets = response[:data]
  end

  def create_sheet(data)
    body = {
      name: data.name,
      columns: [
        {
          title: 'Favorite',
          type: 'CHECKBOX',
          symbol: 'STAR',
          width: 10
        },
        {
          title: 'Primary Column',
          type: 'TEXT_NUMBER',
          primary: true
        }
      ]
    }

    response = @client.sheets.create(
      body: body
    )

    new_sheet = response[:result]
  end

  def create_sheet_in_folder
    folder_id =
      puts 'Enter name for new sheet: '
    name = gets.chomp
    body = {
      name: name,
      columns: [
        {
          title: 'Favorite',
          type: 'CHECKBOX',
          symbol: 'STAR',
          width: 10
        },
        {
          title: 'Primary Column',
          type: 'TEXT_NUMBER',
          primary: true
        }
      ]
    }

    response = @client.sheets.create_in_folder(
      folder_id: 3_606_003_104_147_332,
      body: body
    )
    new_sheet = response[:result]
  end

  def get_sheet_by_id(sheet_id)
    file = @client.sheets.get(
      sheet_id: sheet_id
    )
  end

  def get_column(sheet_id, column_id)
    column = @client.sheets.columns.get(
      sheet_id: sheet_id,
      column_id: column_id
    )
    byebug
  end

  def get_csv(sheet_id)
    file_contents = @client.sheets.get_as_csv(
      sheet_id: sheet_id
    )

    File.open('output.csv', 'wb+') { |f| f.write(file_contents) }
  end

  def create_sheet_in_workspace
    test_workspace_id = 3_606_003_104_147_332
    puts 'Enter name for new sheet: '
    name = gets.chomp
    body = {
      name: name,
      columns: [
        {
          title: 'Favorite',
          type: 'CHECKBOX',
          symbol: 'STAR',
          width: 10
        },
        {
          title: 'Primary Column',
          type: 'TEXT_NUMBER',
          primary: true
        }
      ]
    }

    response = @client.sheets.create_in_workspace(
      workspace_id: 3_606_003_104_147_332,
      body: body
    )
    new_sheet = response[:result]
  end

  def delete_sheet
    puts 'Enter sheet ID number:'
    sheet_id = gets.chomp
    response = @client.sheets.delete(sheet_id: sheet_id)
    "Delete sheet id: #{sheet_id} : #{response[:message]}"
  end

  def overview
    contents = @client.home.list
  end
  end
