module gio.TlsFileDatabaseT;

public  import gio.c.functions;
public  import gio.c.types;
public  import glib.ConstructionException;
public  import glib.ErrorG;
public  import glib.GException;
public  import glib.Str;
public  import gobject.ObjectG;


/**
 * #GTlsFileDatabase is implemented by #GTlsDatabase objects which load
 * their certificate information from a file. It is an interface which
 * TLS library specific subtypes implement.
 *
 * Since: 2.30
 */
public template TlsFileDatabaseT(TStruct)
{
	/** Get the main Gtk struct */
	public GTlsFileDatabase* getTlsFileDatabaseStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GTlsFileDatabase*)getStruct();
	}

}
