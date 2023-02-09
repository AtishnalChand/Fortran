      program readcsv
         implicit none
         integer, parameter :: n = 1
         ! Declare variables to store the respective uncertainity
         real :: A1, A2, A3, A4, A5, A6
         integer :: i, ierror

         open(10, file = "data1.csv", status = 'old', Iostat = ierror)
         
         ! Check if there was an error opening the file
         If (ierror /= 0) Then
           print*, "Error opening file data.csv"
            Stop
         End If
         
         ! Read a null line from the file (ignores header line)
            read(10, '()', Iostat = ierror)
         
         ! Check if there was an error reading the header line
          If (ierror /= 0) Then
             print*, "Error reading header line from file data.csv"
             Stop
          End If

         do i = 1, n
            read (10, *, Iostat = ierror) A1, A2, A3, A4, A5, A6
           
         ! Check if there was an error reading the data
         If (ierror /= 0) Then
            print*, "Error reading data from file data.csv"
           Stop
         End If
           
          ! Print the uncertainty values to confirm if values were successfully read and stored in the respective variable
             print*, A1, A2, A3, A4, A5, A6
         end do

         close(10)
      end program readcsv
