module soup.SessionAsync;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import soup.Session;
private import soup.c.functions;
public  import soup.c.types;


/** */
public class SessionAsync : Session
{
	/** the main Gtk struct */
	protected SoupSessionAsync* soupSessionAsync;

	/** Get the main Gtk struct */
	public SoupSessionAsync* getSessionAsyncStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupSessionAsync;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupSessionAsync;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupSessionAsync* soupSessionAsync, bool ownedRef = false)
	{
		this.soupSessionAsync = soupSessionAsync;
		super(cast(SoupSession*)soupSessionAsync, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_session_async_get_type();
	}

	/**
	 * Creates an asynchronous #SoupSession with the default options.
	 *
	 * Deprecated: #SoupSessionAsync is deprecated; use a plain
	 * #SoupSession, created with soup_session_new(). See the <link
	 * linkend="libsoup-session-porting">porting guide</link>.
	 *
	 * Returns: the new session.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = soup_session_async_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupSessionAsync*) __p, true);
	}
}
