function open_pdf_with_pdfstudio2020_on_WSL() {
    # Define the path to PDF Studio executable in Windows format
    PDF_STUDIO_PATH="C:\Program Files\PDFStudio2020\pdfstudio2020.exe"

    # Get the absolute path of the PDF file in WSL
    PDF_PATH=$(realpath $1)

    # Define a Windows directory to copy the PDF file to (modify as needed)
    WINDOWS_PDF_DIR="/mnt/c/Users/wyusu/Documents/"

    # Extract the filename from the PDF path
    PDF_FILENAME=$(basename $PDF_PATH)
    echo $PDF_FILENAME

    # Copy the PDF file to the Windows directory
    yes | cp $PDF_PATH $WINDOWS_PDF_DIR > /dev/null

    # Construct the Windows path for the copied PDF file
    PDF_PATH_WIN="C:\Users\wyusu\Documents\\${PDF_FILENAME}"

    echo $PDF_PATH_WIN

    # Check if PDF Studio is running and open the PDF in a new tab if it is
    if tasklist.exe | grep -q 'pdfstudio2020.exe'; then
        taskkill /IM "pdfstudio2020.exe" /F
        cmd.exe /C start "" "${PDF_STUDIO_PATH}" "${PDF_PATH_WIN}"
    else
        cmd.exe /C start "" "${PDF_STUDIO_PATH}" "${PDF_PATH_WIN}"
    fi
    
}

function open_pdf_or_exit() {
    # Ask the user if they want to open the PDF
    echo -e "\nDo you want to open the PDF file? (y/n)"
    read -n 1 -r  # Read a single character

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        open_pdf_with_pdfstudio2020_on_WSL $1
    fi
}
