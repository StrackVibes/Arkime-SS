<a name="readme-top"></a>
<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/StrackVibes/Arkime">
    <img src="https://i.ibb.co/Ws4Nvcj/Arkime-Logo-Full-Gradient-Black-2x.png" alt="Logo" >
  </a>

<h3 align="center">Arkime Simplified Setup</h3>

  <p align="center">
    Welcome to the Arkime Simplified Setup! This project aims to simplify the process of setting up Arkime, which can be daunting for brand-new network analysts. Unlike the traditional Arkime build, this repository provides a streamlined approach using Docker Compose and environment variables.
    <br />
    ·
    <a href="https://github.com/StrackVibes/Arkime/issues">Report Bug</a>
    ·
    <a href="https://github.com/StrackVibes/Arkime/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
The simplified setup process reduces the barriers for entry, making it accessible for network analysts of all experience levels. With just a few adjustments, you'll have a fully functional Arkime environment tailored to your needs.

By modifying the environment variables in the docker-compose file, you can easily customize and configure your Arkime cluster. This flexibility allows you to effortlessly wipe the cluster, change the password, and even switch between different versions of Arkime.

Get started with Arkime Simplified Setup today and experience the power of Arkime without the complexities of the traditional setup. Empower yourself as a network analyst and dive into the world of network traffic analysis with ease.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Before you begin, ensure that you have the following dependencies installed:
* docker
  ```sh
  sudo apt install docker-ce -g
  ```
  NOTE: To avoid using sudo for docker activities, add your username to the Docker Group
  ```sh
  sudo usermod -aG docker ${USER}
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/StrackVibes/Arkime.git
   ```
2. Set the memory requirements for the Elasticsearch instance.
   ```sh
   sudo sysctl -w vm.max_map_count=262144
   ```
3. (Optional) Change environment variables in docker-compose.yml
   ```js
   nano ./docker-compose.yml
   ```
4. Run docker
   ```sh
   docker compose up -d
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

To make the most of Arkime, follow these steps:

1. Access the Interface: Open your preferred web browser and navigate to the following URL:
   ```sh
   http://localhost:8005
   ```
2. Login with your username and password. Defaults listed below:
   ```sh
   Username: admin
   Password: password
   ```
_For tool usage, please refer to the [Arkime Documentation]([https://example.com](https://arkime.com/learn))_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Arkime Environment variables available

| NAME              | DEFAULT VALUE   |  NOTES                                                                   |
| --------------    | --------------- | ---------------------------------------------------------------------    |
| INITALIZEDB       | true            | Make this true on the first execution and false every other time         |
| ARKIME_PASSWORD   | password        | To connect admin use on the web interface                                |
| WIPEDB            | true            | Erases all data                                                          |
| ARKIME_VERSION    | 5.5.1           | According to [Arkime version nomenclature](https://github.com/arkime/arkime/releases) |
| UBUNTU_VERSION    | 2004_amd64      | The version of Ubuntu base container                                     |
| ES_HOST           | elasticsearch   | Should use `elasticsearch` or `localhost` depending on network type      |
| ES_PORT           | 9200            | Elastic search port in elastic search container or exposed in any server |
| ARKIME_INTERFACE  | eth0            | Network interface to listen                                              |
| CAPTURE           | off             | Uses the capture interface to collect traffic                            |
| VIEWER            | on              | Can be utilized via port 8005                                            |
| CONT3XT           | on              | Can be utilized via port 3218                                            |
| WISE              | on              | Turns plugin on/off                                                      |

<!-- ROADMAP -->
## Roadmap

- [x] Create one-stop shop
- [x] Add Wise tags
- [ ] Cont3xt valueactions
- [ ] Easy pcap injest script

See the [open issues](https://github.com/StrackVibes/Arkime/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Shane Strack - [@INshane09](https://twitter.com/inshane09/)

Project Link: [https://github.com/StrackVibes/Arkime](https://github.com/StrackVibes/Arkime)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Arkime](https://github.com/arkime/arkime)
* [MathieM](https://github.com/MathieM/docker-moloch/blob/master/README.md)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/StrackVibes/Arkime.svg?style=for-the-badge
[contributors-url]: https://github.com/StrackVibes/Arkime/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/StrackVibes/Arkime.svg?style=for-the-badge
[forks-url]: https://github.com/StrackVibes/Arkime/network/members
[stars-shield]: https://img.shields.io/github/stars/StrackVibes/Arkime.svg?style=for-the-badge
[stars-url]: https://github.com/StrackVibes/Arkime/stargazers
[issues-shield]: https://img.shields.io/github/issues/StrackVibes/Arkime.svg?style=for-the-badge
[issues-url]: https://github.com/StrackVibes/Arkime/issues
[license-shield]: https://img.shields.io/github/license/StrackVibes/Arkime.svg?style=for-the-badge
[license-url]: https://github.com/StrackVibes/Arkime/blob/master/LICENSE.txt
[product-screenshot]: images/screenshot.png
