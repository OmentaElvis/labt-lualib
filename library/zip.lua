-- BSD 2-Clause License

-- Copyright (c) 2024, Elvis Omenta

-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:

-- 1. Redistributions of source code must retain the above copyright notice, this
--    list of conditions and the following disclaimer.

-- 2. Redistributions in binary form must reproduce the above copyright notice,
--    this list of conditions and the following disclaimer in the documentation
--    and/or other materials provided with the distribution.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
-- FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
-- SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
-- CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-- OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-- OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

--- @meta zip

--- Provides common simple zip utilities that are frequently used on android builds. It gives the bare minimum functions that can be used for things like creating zip archives, adding files to existing archive, extracting all files and extracting single files. The base zip methods returns a lua table that is used to keep track of zip operations. No I/O operations are performed until the operations are "committed" by a final function
zip = {}

--- @class ZipEntry An entry on the zip file
local entry = {}


--- @class ZipWriter
local zip_writer = {}

--- Adds a file entry to the zip. This file will be added to the zip file during write.
--- @param name string The file name as shown in the zip file
--- @param disk_path string The path to the file that is to be added to the archive
--- @param alignment? number sets the alignment of this file entry on the archive
--- @return ZipEntry entry An entry to be added on the zip archive
function zip_writer:add_file(name, disk_path, alignment) end

--- Adds a directory entry to the zipinfo object. This directory will be added to the final zip archive file. Returns self.
--- Note: This function does not add entire disk directory onto the archive. It only creates a directory tree in the zip archive.
--- @param name string The directory name entry as shown in the zip file
--- @return ZipWriter
function zip_writer:add_directory(name) end

--- Commits this zip object to disk. This function starts the actual archive writing operation.
--- Returns an error if:
--- internal IO error occurs such as file access error
function zip_writer:write() end


--- Starts a new zip archive.
--- @param file string
--- @return ZipWriter writer Zip file info 
function zip.new(file) end

--- Starts a new zip archive in append mode.
--- @param file string
--- @return ZipWriter writer Zip file info 
function zip.new_append(file) end

--- @class ZipReader
local zip_reader = {}

--- Adds the file name to the list of entries that you would like to extract from the archive. 
--- The file name must be a valid file entry in the archive.
--- If extract_path is nil, the root extract path set by the extract method is used.
--- @param name string A valid name entry in the zip archive
--- @param extract_path string The path where this file will be written on disk
--- @return ZipReader reader The zip reader
function zip_reader:with_name(name, extract_path) end


--- Extracts the listed files or all files onto the specified directory. 
--- This method goes through the list of entries added with `with_name` and extracts them one by one. If a file entry has its own output directory specified by `with_name` function, it is used to write the file otherwise the `output_path` argument is used as the destination directory.
--- If a file entry name has a directory tree e.g. path/to/my/file.txt, all the missing paths are created.
--- if `extract_all` option is specified as true, all the files in the archive are extracted ignoring the filter entries added by with_name
--- This function overwrites output file if conflicted by an existing file.
--- Returns an error if:
--- - Underlying IO error occurs that was unexpected
--- - The zip file to extract was not found or failed to open
--- - An entry set by `with_name` was not found in zip file
--- - Failed to create output directory tree
--- - Invalid or insecure zip entry name
--- - Invalid file entry base name
--- - Failed to open output file for write.
--- ```
--- local zipinfo = zip.open("test.zip");
--- -- extract all files
--- zipinfo:extract("path/to/output", true);
--- ```
--- @param output_path string The extraction destination path. Must exist on the file system
--- @param extract_all boolean If we should extract everything to destination path
function zip_reader:extract(output_path, extract_all) end

--- Opens a zip archive in read mode. This allows the user to extract files from an archive to disk.
--- @param file string
--- @return ZipReader reader Zip file reader
function zip.open(file) end
