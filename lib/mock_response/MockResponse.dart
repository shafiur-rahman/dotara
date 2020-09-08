import 'dart:convert';

import 'package:dotara/constants/ProjectConstants.dart';



class MockResponse {
  static String getBandInfo() {
    return json.encode({
      "band_name": "Dolchut",
      "title": "https://i.ibb.co/fpbJVFG/Dalchhut-Logo-22-04-1.png",
      "cover_pic": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png"
    });
  }

  static String getAnouncement() {
    return json.encode({
      "banners": [
        {
          "title": "Lets meet us on dhaka",
          "caption": "Here we gonna something",
          "banner_pic": "https://i.ibb.co/x6qvM0S/dolchut-cover.png"
        },
        {
          "title": "Lets meet us on Chattogram",
          "caption": "Here we gonna something",
          "banner_pic": "https://i.ibb.co/x6qvM0S/dolchut-cover.png"
        },
      ]
    });
  }

  static String getAlbumList() {
    return json.encode({
      "album_list": [
        {
          "album_id": 1,
          "title": "Jochna bihar",
          "loved_by": "3.6M",
          "image_url":
          "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
        },
        {
          "album_id": 2,
          "title": "Ay amontron",
          "loved_by": "3.6M",
          "image_url": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
        },
        {
          "album_id": 3,
          "title": "Akashchuri",
          "loved_by": "3.6M",
          "image_url": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
        },
        {
          "album_id": 4,
          "title": "Hridoypur",
          "loved_by": "3.6M",
          "image_url": "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
        },
        {
          "album_id": 5,
          "title": "Ah",
          "loved_by": "3.6M",
          "image_url": "https://i.ibb.co/F5k78nW/album-ah.jpg",
        },

      ]
    });
  }

  static String getNewRelease() {
    return json.encode({
      "album_list": [
        {
          "album_id": 1,
          "title": "jochna Bihar",
          "loved_by": "3.6M",
          "image_url":
          "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
          "premeium": true
        },
        {
          "album_id": 2,
          "title": "Ay Amontron",
          "loved_by": "3.6M",
          "image_url": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          "premeium": true
        },
        {
          "album_id": 3,
          "title": "Mondabaru",
          "loved_by": "3.6M",
          "image_url": "https://i.ibb.co/YfCmr1v/album-mondabaru.jpg",
          "premeium": true
        },
        {
          "album_id": 4,
          "title": "Hridoypur",
          "loved_by": "3.6M",
          "image_url": "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          "premeium": true
        },
      ]
    });
  }

  static String getAlbumDetails(var body) {
    var bodyContent = json.decode(body);
    if (bodyContent["album_id"] == 1) {
      return json.encode({
        "album_info": {
          "album_banner": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
          "album_name": "Jochona Bihar",
          "song_count": "13"
        },
        "song_list": [
          {
            "song_id": 1,
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "song_name": "Mon Chuyecho",
            "album_name": "Jochona Bihar",
          },
          {
            "song_id": 2,
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "media_url": SAMPLE_MEDIA_URL_2,
            "loved_by": "3.6M",
            "song_name": "Hater Upor Hater Porosh",
            "album_name": "Jochona Bihar",
          },
          {
            "album_name": "Jochona Bihar",
            "song_id": 3,
            "song_name": "Shobuj Khuji",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "loved_by": "3.6M",
          },
          {"loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_id": 4,
            "song_name": "Cholte Cholte",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
          },
          {
            "loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_id": 5,
            "song_name": "Jochna Bihar",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
          },
          {
            "loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_id": 6,
            "song_name": "Din Shara Din",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
          },

          {
            "loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_name": "Valo Lage Na",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "song_id": 7,
          },
          {
            "loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_name": "Char Deyal",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "song_id": 8,
          },
          {
            "loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_name": "Akuti",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "song_id": 9,
          },
          {
            "loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_name": "Megh Piyon",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "song_id": 10,
          },
          {
            "loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_name": "Nongorer Golpo",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "song_id": 11,
          },
          {
            "loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_name": "Dhori Mach Na Chui Pani",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "song_id": 12,
          },
          {
            "loved_by": "3.6M",
            "album_name": "Jochona Bihar",
            "song_name": "Orup Ovilashi",
            "song_thumb": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",
            "song_id": 13,
          },
        ]
      });
    } else if (bodyContent["album_id"] == 2) {
      return json.encode({
        "album_info": {
          "album_banner": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          "album_name": "Ay Amontron",
          "song_count": "11"
        },
        "song_list": [
          {
            "song_id": 1,
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "song_name": "Balika",
            "album_name": "Ay Amontron"
          },
          {
            "song_id": 2,
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
            "media_url": SAMPLE_MEDIA_URL_2,
            "loved_by": "3.6M",
            "song_name": "Bidrup",
            "album_name": "Ay Amontron"
          },
          {
            "album_name": "Ay Amontron",
            "song_id": 3,
            "song_name": "Joler Preme",
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          },
          {
            "album_name": "Ay Amontron",
            "song_id": 4,
            "song_name": "Bangladeshe Grishsho",
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          },
          {
            "album_name": "Ay Amontron",
            "song_id": 5,
            "song_name": "Notojanu",
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          },
          {
            "album_name": "Ay Amontron",
            "song_id": 6,
            "song_name": "Proshno",
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          },
          {
            "album_name": "Ay Amontron",
            "song_id": 7,
            "song_name": "Shamney Dara",
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          },
          {
            "album_name": "Ay Amontron",
            "song_id": 8,
            "song_name": "Shopno",
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          },
          {
            "album_name": "Ay Amontron",
            "song_id": 9,
            "song_name": "Ural Mon",
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          },
          {
            "album_name": "Ay Amontron",
            "song_id": 10,
            "song_name": "Shunno",
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          },
          {
            "album_name": "Ay Amontron",
            "song_id": 11,
            "song_name": "Teer Hara Ei Dheuer Shagor",
            "song_thumb": "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          },

        ]
      });
    } else if (bodyContent["album_id"] == 3) {
      return json.encode({
        "album_info": {
          "album_banner": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
          "album_name": "Akashchuri",
          "song_count": "12"
        },
        "song_list": [
          {
            "song_id": 1,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Chader Shohore",
          },
          {
            "song_id": 2,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Hridoyer Daabi",
          },
          {
            "song_id": 3,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Firey Chai",
          },
          {
            "song_id": 4,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Jor",
          },
          {
            "song_id": 5,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Chhuri Chikitsha",
          }, {
            "song_id": 6,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Bhenge Poth",
          }, {
            "song_id": 7,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Akashchuri",
          }, {
            "song_id": 8,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Kar Chhobi Nei",
          }, {
            "song_id": 9,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Ferari Somoy",
          }, {
            "song_id": 10,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Ei Noshto Shohore",
          }, {
            "song_id": 11,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Opekkha",
          }, {
            "song_id": 12,
            "album_name": "Akashchuri",
            "song_thumb": "https://i.ibb.co/8bCzrYL/akash-churi.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",

            "song_name": "Bayoshkop",
          },

        ]
      });
    } else if (bodyContent["album_id"] == 4) {
      return json.encode({
        "album_info": {
          "album_banner": "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          "album_name": "Hridoypur",
          "song_count": "11"
        },
        "song_list": [
          {
            "song_id": 1,
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "song_name": "Gari Chole Na",
            "album_name": "hridoypur",
          },
          {
            "song_id": 2,
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
            "media_url": SAMPLE_MEDIA_URL_2,
            "loved_by": "3.6M",
            "song_name": "Baazi",
            "album_name": "hridoypur",
          },
          {
            "album_name": "hridoypur",
            "song_id": 3,
            "song_name": "Nouka Vromon",
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          },
          {
            "album_name": "hridoypur",
            "song_id": 4,
            "song_name": "Chader Jonno Gaan",
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          },
          {
            "album_name": "hridoypur",
            "song_id": 5,
            "song_name": "Joler Dame",
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          },
          {
            "album_name": "hridoypur",
            "song_id": 6,
            "song_name": "Tomakei Bole Debo",
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          },
          {
            "album_name": "hridoypur",
            "song_id": 7,
            "song_name": "Amar Shontan",
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          },
          {
            "album_name": "hridoypur",
            "song_id": 8,
            "song_name": "Shobuj Jokhon",
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          },
          {
            "album_name": "hridoypur",
            "song_id": 9,
            "song_name": "Gach",
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          },
          {
            "album_name": "hridoypur",
            "song_id": 10,
            "song_name": "Bristi",
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          },
          {
            "album_name": "hridoypur",
            "song_id": 11,
            "song_name": "Cholo Bubaijaan",
            "song_thumb":  "https://i.ibb.co/2FWdTDM/album-hridoypur.jpg",
          },
        ]
      });
    }
    else if (bodyContent["album_id"] == 5) {
      return json.encode({
        "album_info": {
          "album_banner": "https://i.ibb.co/F5k78nW/album-ah.jpg",
          "album_name": "Ah",
          "song_count": "8"
        },
        "song_list": [
          {
            "song_id": 1,
            "song_thumb":  "https://i.ibb.co/F5k78nW/album-ah.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "album_name": "Ah",

            "song_name": "Chokh",
          },
          {
            "song_id": 2,
            "song_thumb":  "https://i.ibb.co/F5k78nW/album-ah.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "album_name": "Ah",

            "song_name": "Dolchut",
          },
          {
            "song_id": 3,
            "song_thumb":  "https://i.ibb.co/F5k78nW/album-ah.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "album_name": "Ah",

            "song_name": "Guitar",
          },
          {
            "song_id": 4,
            "song_thumb":  "https://i.ibb.co/F5k78nW/album-ah.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "album_name": "Ah",

            "song_name": "Kaga",
          },
          {
            "song_id": 5,
            "song_thumb":  "https://i.ibb.co/F5k78nW/album-ah.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "album_name": "Ah",

            "song_name": "Mone pore",
          },{
            "song_id": 6,
            "song_thumb":  "https://i.ibb.co/F5k78nW/album-ah.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "album_name": "Ah",

            "song_name": "nishidho",
          },
          {
            "song_id": 7,
            "song_thumb":  "https://i.ibb.co/F5k78nW/album-ah.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "album_name": "Ah",

            "song_name": "Rongila",
          },{
            "song_id": 8,
            "song_thumb":  "https://i.ibb.co/F5k78nW/album-ah.jpg",
            "media_url": SAMPLE_MEDIA_URL,
            "loved_by": "3.6M",
            "album_name": "Ah",

            "song_name": "Sunglass",
          },

        ]
      });
    }
  }

  static String getEventDetails() {
    return json.encode({
      "banner_id": 1,
      "banner_url":
      "https://i.ibb.co/x6qvM0S/dolchut-cover.png",
      "description":
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      "schedule": "10 August 2020"
    });
  }

  static String getEvents() {
    return json.encode({
      "events": [
        {
          "id": 1,
          "banner_url":
          "https://i.ibb.co/YRhs6gw/dolchut-cover-2.png",
        },
        {
          "id": 2,
          "banner_url":
          "https://i.ibb.co/YRhs6gw/dolchut-cover-2.png", },
        {
          "id": 3,
          "banner_url":
          "https://i.ibb.co/x6qvM0S/dolchut-cover.png", },
        {
          "id": 4,
          "banner_url":
          "https://i.ibb.co/x6qvM0S/dolchut-cover.png",}
      ]
    });
  }

  static String getSongDetail(var body) {
    var bodyContent = json.decode(body);

    if (bodyContent["song_id"] == 1) {
      return json.encode({
        "song_id": 1,
        "song_thumb":
        "https://i.ibb.co/z5mTsYs/4b1c8e14-79c5-41e9-a2d7-22535568374c-1.png",
        "loved_by": "3.6M",
        "song_name": "Balika",
        "album_name": "Ay Amontron"
      });
    } else if (bodyContent["song_id"] == 2) {
      return json.encode({
        "song_id": 1,
        "song_thumb":
        "https://i.ibb.co/z5mTsYs/4b1c8e14-79c5-41e9-a2d7-22535568374c-1.png",
        "loved_by": "3.6M",
        "song_name": "Bidrup",
        "album_name": "Ay Amontron"
      });
    } else if (bodyContent["song_id"] == 3) {
      return json.encode({
        "song_id": 1,
        "song_thumb":
        "https://i.ibb.co/z5mTsYs/4b1c8e14-79c5-41e9-a2d7-22535568374c-1.png",
        "loved_by": "3.6M",
        "song_name": "Joler Preme",
        "album_name": "Ay Amontron"
      });
    } else {
      return json.encode({
        "song_id": 1,
        "song_thumb":
        "https://i.ibb.co/z5mTsYs/4b1c8e14-79c5-41e9-a2d7-22535568374c-1.png",
        "loved_by": "3.6M",
        "song_name": "Balika",
        "album_name": "Ay Amontron"
      });
    }
  }

  static String getItems() {
    return json.encode({
      "items": [
        {
          "id": 1,
          "image_url":
          "https://cdn.shopify.com/s/files/1/0956/3508/products/highs-and-lows-wristband-christian-wristband-13295633137760_grande.jpg?v=1571846566",
          "name": "Wrist Band",
          "price": "80"
        },
        {
          "id": 2,
          "image_url":
          "https://fabrilife.com//highres_products/designproduct5b991a42186dd.png",
          "name": "T-Shirt",
          "price": "280"
        },
        {
          "id": 3,
          "image_url":
          "https://media.fanaticguitars.com/2016/05/alhambra-4p-1.jpg",
          "name": "Guitar",
          "price": "4250"
        },
        {
          "id": 4,
          "image_url":
          "https://www.devmusical.in/assets/1565689920066-Gibson,%20Guitar%20Pick,%20Wedge%20Style%20-Medium%20APRGG-73M.jpg",
          "name": "Guitar Pick",
          "price": "100"
        },
        {
          "id": 5,
          "image_url":
          "https://www.wristband.com/getmedia/39e8524b-fcd8-42cb-b437-56ce31923fc3/Printed-Category-Image.aspx?width=500",
          "name": "Wrist Band",
          "price": "80"
        },
        {
          "id": 6,
          "image_url": "https://i.ibb.co/kcWtZx8/dolchut-tshirt.png",
          "name": "T-Shirt",
          "price": "280"
        },
        {
          "id": 7,
          "image_url":
          "https://cdn.shopify.com/s/files/1/2547/8010/files/TravelDeluxe_Angle1_1_800x800@2x.jpg?v=1586571358",
          "name": "Guitar",
          "price": "4250"
        },
        {
          "id": 8,
          "image_url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQliv3kBXFBkcff_QNG6A4UGudBqD55vHucVQ&usqp=CAU",
          "name": "Guitar Pick",
          "price": "100"
        },
        {
          "id": 9,
          "image_url":
          "https://cdn.shopify.com/s/files/1/0956/3508/products/highs-and-lows-wristband-christian-wristband-13295633137760_grande.jpg?v=1571846566",
          "name": "Wrist Band",
          "price": "80"
        },
        {
          "id": 10,
          "image_url": "https://i.ibb.co/tsDKvpY/dolchut.png",
          "name": "T-Shirt",
          "price": "280"
        },
        {
          "id": 11,
          "image_url":
          "https://max.guitars/media/catalog/product/cache/b150fffca6c4acf3e4f1eaba61f8bd06/m/a/max_guitar_art-16410_fender_cs_51_tele_aged_nocaster_r106327-1.jpg",
          "name": "Guitar",
          "price": "4250"
        },
        {
          "id": 12,
          "image_url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwCEqmw-NPl25KMNVJ_kBzDVHYhIRqhzq5Nw&usqp=CAU",
          "name": "Guitar Pick",
          "price": "100"
        },
      ]
    });
  }

  static String getMyMusicList() {
    return json.encode({
      "items": [
        {
          "id": 3,
          "image_url":
          "https://i.ibb.co/YTj89sm/Dolchut-Cover-Pic.png",
          "name": "Balika",
        },
        {
          "id": 4,
          "image_url":  "https://i.ibb.co/F5k78nW/album-ah.jpg",
          "name": "Chokh",
        },
        {
          "id": 5,
          "image_url": "https://i.ibb.co/qjqjBbF/24a6620b-e9bd-49c7-af3a-6b6c6b1f03c7-1.png",

          "name": "Mon Chuyecho",
        },
      ]
    });
  }

  static String getProfile() {
    return json.encode({
      "name": "Arko Roy",
      "image_url":
      "https://fdn.gsmarena.com/imgroot/reviews/18/iphone-x-vs-galaxy-s9-plus/camera2/-216/gsmarena_154.jpg",
      "subscribed": true,
      "plan_name": "Starter Pack"
    });
  }



  //TODO: Dotara

  static String getGenreList() {
    return json.encode({
      "items": [
        {
          "id": 1,
         "name": "Classic"
        },
        {
          "id": 2,
          "name": "Rock"
        },
        {
          "id": 3,
          "name": "Soul"
        },
        {
          "id": 4,
          "name": "Heavy Metal"
        },
        {
          "id": 5,
          "name": "Pop"
        },
        {
          "id": 6,
          "name": "Folk"

        },
        {
          "id": 7,
          "name": "Jazz"

        },

        {
          "id": 8,
          "name": "dance"

        },

        {
          "id": 9,
          "name": "Disco"

        },
      ]
    });
  }



}
