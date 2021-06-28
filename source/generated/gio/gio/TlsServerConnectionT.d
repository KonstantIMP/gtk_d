module gio.TlsServerConnectionT;

public  import gio.IOStream;
public  import gio.TlsCertificate;
public  import gio.c.functions;
public  import gio.c.types;
public  import glib.ConstructionException;
public  import glib.ErrorG;
public  import glib.GException;
public  import gobject.ObjectG;


/**
 * #GTlsServerConnection is the server-side subclass of #GTlsConnection,
 * representing a server-side TLS connection.
 *
 * Since: 2.28
 */
public template TlsServerConnectionT(TStruct)
{
	/** Get the main Gtk struct */
	public GTlsServerConnection* getTlsServerConnectionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GTlsServerConnection*)getStruct();
	}

}
