/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: khuynh <khuynh@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/10 00:51:19 by khuynh            #+#    #+#             */
/*   Updated: 2022/04/13 23:55:58 by khuynh           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stddef.h>

static int	ft_count(const char *s, char c)
{
	int		i;
	size_t	count;

	count = 0;
	i = 0;
	if (!s)
		return (0);
	while (s[i])
	{
		if (i == 0 && s[0] != c)
			count += 1;
		else if (s[i] != c && s[i - 1] == c)
			count += 1;
		i++;
	}
	return (count);
}

static char	*worddup(const char *s, char c)
{
	char	*word;
	size_t	i;

	i = 0;
	if (!s)
		return (0);
	while (s[i] != c && s[i])
	{
		i++;
	}
	word = malloc(sizeof(char) * (i + 1));
	if (!word)
		return (0);
	i = 0;
	while (s[i] && !(s[i] == c))
	{
		word[i] = s[i];
		i++;
	}
	word[i] = '\0';
	return (word);
}

char	**ft_split(char const *s, char c)
{
	size_t	i;
	char	**splity;
	size_t	count;

	i = 0;
	count = ft_count(s, c);
	if (!s)
		return (0);
	splity = malloc(sizeof(char *) * count + 1);
	if (!splity)
		return (0);
	while (*s)
	{
		while (*s == c)
			++s;
		if (*s && *s != c)
		{
			splity[i] = worddup(s, c);
			i++;
			while (*s && *s != c)
				s++;
		}
	}
	splity[i] = NULL;
	return (splity);
}

/*
#include <stdio.h>

int	main(int ac, char **av)
{
	int	i;
	char	**tbl;

	(void) ac;
	tbl = ft_split(av[1], av[2][0]);	
	i = 0;
	while (tbl[i])
	{
		printf("%d = %s\n", i, tbl[i]);
		i++;
	}
	return (0);
}*/