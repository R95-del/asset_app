# Inventory Management System (IMS)

## Overview
The Inventory Management System (IMS) is a web application designed to manage items, brands, categories, and allotments efficiently. It supports user authentication, including admin privileges, and provides functionality to export data to Excel and PDF formats. The application is built with Ruby on Rails and integrates Google OmniAuth for user authentication.

## Features
- **User Authentication**: Secure user authentication using Devise, including Google OmniAuth integration.
- **Admin Privileges**: Admin users can manage all resources and have additional privileges.
- **Item Management**: Add, edit, delete, and view items.
- **Brand Management**: Add, edit, delete, and view brands.
- **Category Management**: Add, edit, delete, and view categories.
- **Allotment Management**: Allocate and deallocate items to users.
- **Export Data**: Export lists of brands, categories, items, and allotments to Excel and PDF formats.
- **Responsive Design**: Mobile-friendly UI using Bootstrap.

## Installation
### Prerequisites
- Ruby (version 2.7.2 or later)
- Rails (version 6.1.4 or later)
- PostgreSQL

### Steps
1. **Clone the repository**:
    ```sh
    git clone https://github.com/R95-del/asset_app.git
    cd asset_app
    ```

2. **Install dependencies**:
    ```sh
    bundle install
    ```

3. **Set up the database**:
    ```sh
    rails db:create
    rails db:migrate
    ```

4. **Run the Rails server**:
    ```sh
    rails server
    ```

5. **Access the application**:
    Open your browser and go to `http://localhost:3000`.

## Usage
### Admin Tasks
- **Add a New Brand**: Go to the Brands section and click on "Add New Brand".
- **Add a New Category**: Go to the Categories section and click on "Add New Category".
- **Add a New Item**: Go to the Items section and click on "Add New Item".
- **Allocate an Item**: Go to the Allotments section and allocate items to users.
- **Deallocate an Item**: Deallocate items from users as needed.

### Exporting Data
- **Export Brands to Excel**: Navigate to the Brands index page and click on "Export to Excel".
- **Export Categories to Excel**: Navigate to the Categories index page and click on "Export to Excel".
- **Export Items to Excel**: Navigate to the Items index page and click on "Export to Excel".
- **Export Allotments to Excel**: Navigate to the Allotments index page and click on "Export to Excel".
- **Export Brands to PDF**: Navigate to the Brands index page and click on "Export to PDF".
- **Export Categories to PDF**: Navigate to the Categories index page and click on "Export to PDF".
- **Export Items to PDF**: Navigate to the Items index page and click on "Export to PDF".
- **Export Allotments to PDF**: Navigate to the Allotments index page and click on "Export to PDF".

### Google OmniAuth Integration
- Users can sign in using their Google accounts. The authentication is handled through Devise and OmniAuth gems.

## Contributing
1. **Fork the repository**.
2. **Create a new branch**:
    ```sh
    git checkout -b feature-name
    ```
3. **Make your changes**.
4. **Commit your changes**:
    ```sh
    git commit -m 'Add some feature'
    ```
5. **Push to the branch**:
    ```sh
    git push origin feature-name
    ```
6. **Create a new Pull Request**.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For any inquiries, please contact Rishi at somani.rishi81@gmail.com.
