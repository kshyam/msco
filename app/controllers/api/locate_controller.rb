class Api::LocateController < ApplicationController
  def beacon
    request_env = request.env
    status_code = 200
    result_hash = case params[:id].try(:downcase)
      when "2f234454-cf6d-4a0f-adf2-f4911ba9ffa6"
        {
          uid: params[:id],
          message: 'Hey Cass, Welcome to CCC'
        }
      when "ffffffff-1234-aaaa-1a2b-a1b2c3d4e5f6"
        {
          uid: params[:id],
          message: 'Welcome to H&M store at CCC'
        }
      # when "12345678-abcd-88cc-1111aaaa2222"
      #   {
      #     uid: params[:id],
      #     message: 'Hey Cass, Welcome to CCC Store H&M'
      #   }
      # when "ffffffff-ffff-ffff-ffff-ffffffffffff"
      #   {
      #     uid: params[:id],
      #     message: 'Thank you Cass, for visiting CCC'
      #   }
      else
        status_code = 400
        nil
    end

    render json: result_hash.to_json
  end

  def barcode
    request_env = request.env
    status_code = 200

    result_hash = case params[:id]
      when "9781598691009"
        result[0]
      when "9781932841855"
        result[1]
      when "200456292"
        result[2]
      when "9786163619389"
        result[3]
      when "9780751536140"
        result[4]
      when "8902519002990"
        result[5]
      when "8907403918944"
        result[6]
      when "2050019599987"
        result[7]
      when "MD1263160"
        result[8]
      when "8903779136425"
        result[9]
      when "8903024836452"
        result[10]
      when "2050018359186"
        result[11]
      else
        status_code = 400
        nil
    end

    Sample.create(barcode: params[:id],
                  http_referrer: request_env['HTTP_REFERRER'],
                  http_user_agent: request_env['HTTP_USER_AGENT'],
                  request_uri: request_env['REQUEST_URI'],
                  status: status_code)

    render json: result_hash.to_json
  end

private
  # invalid scans
  # single letter(when placed cross to the left or right)
  # invalid number: 3226332841853(actual scanned barcode: 9781932841855)
  #
  def result
    @result ||= [
      { "barcode": "9781598691009",
        "price": "250",
        "title": "Persuasion",
        "body": "A book by Tom Gorman(Paper Back)" },
      { "barcode": "9781932841855",
        "price": "200",
        "title": "The Oracle Speaks",
        "body": "By David Andrews(Paper Back)" },
      { "barcode": "200456292",
        "price": "199",
        "title": "Instant Vocabulary",
        "body": "By IDA Ehrlich" },
      { "barcode": "9786163619389",
        "price": "400",
        "title": "Pandism",
        "body": "By Pittaya Werasakwong(Paper Back)" },
      { "barcode": "9780751536140",
        "price": "295",
        "title": "The five people you meet in Heaven",
        "body": "By Mitch Albom(Paper Back)" },
      { "barcode": "8902519002990",
        "price": "28",
        "title": "Classmate Notebook",
        "body": "120 Pages(24 x 18cm)" },
      { "barcode": "8907403918944",
        "price": "249",
        "title": "Plain Dupatta(FBB)",
        "body": "Peach Color(Size: 2.5m), Mfg: Sep'15" },
      { "barcode": "2050019599987",
        "price": "399",
        "title": "T Shirt(Westsport)",
        "body": "XL(44 CM) - MRP: 699/-, Offer Price: 399/-" },
      { "barcode": "MD1263160",
        "price": "1198",
        "title": "Kurti(Soch)",
        "body": "XL - Pink Color" },
      { "barcode": "8903779136425",
        "price": "995",
        "title": "T Shirt(Wrangler)",
        "body": "L(107 CM) - Cotton White, Freedom Tee" },
      { "barcode": "8903024836452",
        "price": "649",
        "title": "Bath Towel(Raymond)",
        "body": "(75CM x 1.50M) Color: Blue" },
      { "barcode": "2050018359186",
        "price": "1299",
        "title": "Chinos(Westsport)",
        "body": "91CM, Color: DK Brown - MRP: 1299/-, Offer Price: 699/-" },
      { "barcode": "Not Found",
        "price": "0",
        "title": "Null",
        "body": "Null" }]
  end
end