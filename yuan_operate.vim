function s:Operate()
    let regNum = str2nr(@w)
    if regNum <= 0
        echo "wrong value in regester!"
        return 0
    endif

    let currLine = getline(".")
    let curPosInfo = getcurpos()
    let curPos = curPosInfo[2] - 1

    let posInfo = matchstrpos(currLine, '[.,;: \n\r]', curPos)
    let currNumEndPos = posInfo[1] - 1

    if posInfo[1] > -1
        let currNum = str2nr(currLine[curPos:currNumEndPos])
        if currNum > -1
            let addRes = currNum + regNum
            let newLine = currLine[0:currNumEndPos] . " " . addRes . currLine[currNumEndPos+1:strlen(currLine)-1]
            call setline(".", newLine)
        else
            echo "not a number to operate"
        endif
    endif
endfunction

function s:StoreNum()
    let currLine = getline(".")
    let curPosInfo = getcurpos()
    let curPos = curPosInfo[2]

    let posInfo = matchstrpos(currLine, '[.,;: \n\r]', curPos)

    if posInfo[1] > -1
        let currNum = currLine[curPos-1:posInfo[1]-1]
        let @w = currNum
        echo "w register value: " . @w
    endif
endfunction


nnoremap <leader>yw :call <SID>StoreNum()<cr>
nnoremap <leader>yp :call <SID>Operate()<cr>
