## EIDE Shell Flasher Index

`index.json` type definition:

```ts
export interface ShellFlasherIndexItem {

	/**
	 * tool id (lower case, without whitespace)
	 * 
	 *  format: 
	 * 		'<mcu_class>.<interface_protocol>.<tool_name>' 
	 * 
	 *  interface_protocol:
	 * 		uart
	 * 		swim
	 * 		swd
	 * 		jtag
	 * 
	 *  example: 
	 * 		'mcs51.uart.stcflash'
	 * 		'w801.uart.wm_tool'
	 * 		'stm8.swim.stm8flash'
	*/
	id: string;

	/**
	 * human readable name
	*/
	name: string;

	/**
	 * detail for this tool
	*/
	detail?: string;

	/**
	 * provider (auther)
	*/
	provider?: string;

	/**
	 * platform requirement, like: win32, linux, darwin ...
	*/
	platform: string[];

	/**
	 * eide shell flasher config, refer: src/HexUploader.ts -> CustomFlashOptions
	*/
	flashConfigTemplate: {
		bin: string;
		commandLine: string;
		eraseChipCommand: string;
	}

	/**
	 * scripts install path (default is workspace folder)
	*/
	scriptInstallDir?: string;

	/**
	 * binary resources (optional)
	*/
	resources: {

		// platform require, like: win32, linux, darwin ...
		[platform: string]: {

			url: string; // zip, 7z direct download link (https), like: 'https://test.com/gcc.zip'

			zipType: 'zip' | '7z' | 'none'; // if zipType == 'none', field 'url' will be ignored

			locationType: 'workspace' | 'global';

			/**
			 * if 'locationType' == 'workspace', Install Dir is '${workspaceFolder}/<location>'
			 * 
			 * if 'locationType' == 'global', Install Dir is '${userHome}/.eide/tools/<location>'
			*/
			location: string;

			setupCommand?: string; // (optional) This command will be execuate after resource has been unziped
		}
	}
}
```
