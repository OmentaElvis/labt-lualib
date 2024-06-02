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

--- @meta fs

--- A table containing utility functions for working with the file system
fs = {}

--- Creates the directory specified. If the path provided is relative, this function creates the path relative to the project root. 
--- Returns an error if:
--- - obtaining the project root directory fails
--- - creating the directory fails
--- - directory already exists
--- @param path string Directory to create 
function fs.mkdir(path) end

--- creates the directory specified and all its parent directories if they don't already exist. If the path provided is relative, this function creates the path relative to the project root. 
--- Returns an error if:
--- - obtaining the project root directory fails
--- - creating the directory fails  
--- @param path string Directory to create 
function fs.mkdir_all(path) end

--- Returns true if file exists and false if does not exist. if the file/dir in question cannot be verified to exist or not exist due to file system related errors, the function errors instead.
--- @param path string Directory to check for existence
--- @return boolean exists If file exists
function fs.exists(path) end


--- Returns true if: 
--- - file a is newer than file b 
--- - file b does not exist
--- Returns false if: 
--- - file a does not exist (Technically b should be newer if a is missing)
--- Note: if a folder is provided, it just checks the modification time of the folder, therefore it would not pick changes made to internal files/folders. If you want to check if files change in a folder, then select required files using fs.glob and scan through them.
--- Returns an error if we fail to get the metadata of the file
--- @param path_a string path a to compare
--- @param path_b string path b to compare
--- @return boolean newer if path a is newer than b
function fs.is_newer(path_a, path_b) end


--- Returns all files that match a globing pattern. It returns only files that are readable (did not return IO errors when trying to list them) and files whose path string representation is a valid Unicode. If you specify a relative path, it is evaluated from the root of the project.
--- Returns an error if:
--- - failed to parse the globing pattern;
--- - Failed to get the project root for relative paths
--- - Failed to convert project root + glob pattern into Unicode
--- @param pattern string The globing pattern
--- @return string[] paths List of all matched paths
function fs.glob(pattern) end
