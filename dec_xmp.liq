if test_process("which xmp") then
  xmp_p = (fun (f) -> "xmp -qA -i nearest -f 48000 -o - -d wav #{string.quote(f)} 2>/dev/null")

  def test_xmp(file) =
    ret = get_process_lines("xmp -q --load-only #{string.quote(file)} 2>&1")
    if list.length(ret) != 0 then
      0
    else
      2
    end
  end

  def meta_xmp(file) =
    ret = get_process_lines("xmp --load-only #{string.quote(file)} 2>&1")
    ret = list.map(string.split(separator=":", ret)
    ret["Module name"]
  end

  add_oblivious_decoder(name="xmp", description="Decode files using the xmp \
                        decoder binary.", test=test_xmp, xmp_p)
  add_metadata_resolver("xmp", meta_xmp)
end
