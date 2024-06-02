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


--- @meta labt

--- Labt utility functions. This provides tools necessary for
--- project management and dependency resolution
labt = {}

--- A Project configuration table from Labt.toml
--- @class Project
--- @field name string
--- @field description string
--- @field version_number number
--- @field version string
--- @field package string

-- TODO add dependency class

--- @class LabtToml
--- @field project Project


--- Returns the project configuration stored on Labt.toml file. 
--- The result of this function is a mapping of the configuration 
--- into the Lua table. This function may fail if an error occurs parsing Labt.toml.
--- @return LabtToml config The project config
function labt.get_project_config() end

--- Returns the current build stage/step the plugin was executed on.
--- @return string step build step
function labt.get_build_step() end

--- @class ProjectDependency
--- @field group_id string
--- @field dependencies string[]
--- @field artifact_id string
--- @field packaging string
--- @field version string

--- Returns  This is a full 
--- list of what the project needs to build. The function does not start a 
--- dependency resolution, instead it parses Labt.lock file and returns array of entries found. 
--- If the lock file is empty then an empty array is returned. 
--- Therefore it is assumed that the project dependencies are already resolved.
--- Errors if no Labt.lock file is found.
--- @return ProjectDependency[] list an array of the project resolved dependencies.
function labt.get_lock_dependencies() end



--- Returns the project root directory by recursively looking for Labt.toml up the directory tree. 
--- Returns an error if the project root was not located or labt encountered a file system related error during the search.
--- @return string
function labt.get_project_root() end


--- Calls dependency resolution algorithm on dependencies found in Labt.toml 
--- Returns an error if:
---  - resolving the dependencies fail
---  - failed to read project config [Labt.toml]
---  - failed to read and configure resolvers from config
function labt.resolve() end

--- Returns the cache location for this dependency. This does not check if the path exists. It constructs a valid cache path according to the labt cache resolver. 
--- Returns an error if:
--- - Labt home was not initialized
--- - Failed to convert path to its Unicode string representation
--- @param group_id string
--- @param artifact_id string
--- @param version string
--- @param packaging string
--- @return string
function labt.get_cache_path(group_id, artifact_id, version, packaging) end
